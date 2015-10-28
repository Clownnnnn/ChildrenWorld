//
//  LMKTouchDrawView.m
//  ChildrenWorld
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "LMKTouchDrawView.h"

@interface LMKTouchDrawView ()
@property (nonatomic, strong)UIButton *clearButton;
@property (nonatomic, strong)UIButton *revokeButton;
@property (nonatomic, strong)UIButton *eraserButton;
@property (nonatomic, strong)UIButton *saveButton;
//@property (nonatomic, strong)UIButton *callCemera;
@end

@implementation LMKTouchDrawView

#pragma mark -- 
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"drawBoard.jpg"]];
        self.userInteractionEnabled = YES;
        self.linesCompleted = [[NSMutableArray alloc]init];
        self.allLines = [[NSMutableArray alloc]init];
        [self setMultipleTouchEnabled:YES];
        self.drawColor = [UIColor blackColor];
        [self becomeFirstResponder];
        
        
        self.clearButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
        self.clearButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_reset"]];
//        [self.clearButton setTitle:@"清屏" forState:UIControlStateNormal];
//        [self.clearButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [self.clearButton addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.clearButton];
        
        self.eraserButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 0, 40, 40)];
        self.eraserButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_erase"]];
//        [self.eraserButton setTitle:@"橡皮" forState:UIControlStateNormal];
//        [self.eraserButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [self.eraserButton addTarget:self action:@selector(eraser:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.eraserButton];
        
        self.revokeButton = [[UIButton alloc]initWithFrame:CGRectMake(150, 0, 40, 40)];
        self.revokeButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_return"]];
        //        [self.revokeButton setTitle:@"撤销" forState:UIControlStateNormal];
        //        [self.revokeButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [self.revokeButton addTarget:self action:@selector(revoke:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.revokeButton];
        
        self.saveButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 40, 40)];
        self.saveButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_save"]];
//        [self.saveButton setTitle:@"保存" forState:UIControlStateNormal];
//        [self.saveButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [self.saveButton addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.saveButton];
        
       
        
//        self.callCemera = [[UIButton alloc]initWithFrame:CGRectMake(0, 160, 40, 30)];
//        self.callCemera.backgroundColor = [UIColor blackColor];
//        [self.callCemera setTitle:@"相机" forState:UIControlStateNormal];
//        [self.callCemera setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
//        [self.callCemera addTarget:self action:@selector(callCemera:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.callCemera];
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"drawBoard.jpg"]];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    [self.drawColor set];
    for (LMKLine *line in self.linesCompleted) {
        [[line color] set];
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }
}

- (void)undo
{
    if ([self.undoManager canUndo]) {
        [self.undoManager undo];
        [self setNeedsDisplay];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.undoManager beginUndoGrouping];
    for (UITouch *t in touches) {
        // Create a line for the value
        CGPoint loc = [t locationInView:self];
        LMKLine *newLine = [[LMKLine alloc] init];
        [newLine setBegin:loc];
        [newLine setEnd:loc];
        [newLine setColor:self.drawColor];
        self.currentLine = newLine;
        
    }
}

- (void)addLine:(LMKLine *)line
{
    [[self.undoManager prepareWithInvocationTarget:self] removeLine:line];
    [self.linesCompleted addObject:line];

}

- (void)removeLine:(LMKLine *)line
{
    if ([self.linesCompleted containsObject:line])
        [self.linesCompleted removeObject:line];
}

- (void)removeLineByEndPoint:(CGPoint)point
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        LMKLine *evaluatedLine = (LMKLine *)evaluatedObject;
        return evaluatedLine.end.x == point.x &&
        evaluatedLine.end.y == point.y;
    }];
    NSArray *result = [self.linesCompleted filteredArrayUsingPredicate:predicate];
    if (result && result.count > 0) {
        [self.linesCompleted removeObject:result[0]];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches) {
        [self.currentLine setColor:self.drawColor];
        CGPoint loc = [t locationInView:self];
        [self.currentLine setEnd:loc];
        
        if (self.currentLine) {
            [self addLine:self.currentLine];
        }
        LMKLine *newLine = [[LMKLine alloc] init];
        [newLine setBegin:loc];
        [newLine setEnd:loc];
        [newLine setColor:self.drawColor];
        self.currentLine = newLine;
    }
    [self setNeedsDisplay];
}

- (void)endTouches:(NSSet *)touches
{
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
    [self.undoManager endUndoGrouping];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)didMoveToWindow
{
    [self becomeFirstResponder];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
    }
    return self;
}
-(void)revoke:(UIButton *)sender
{
    [self.linesCompleted removeLastObject];
    [self setNeedsDisplay];
}
-(void)clear:(UIButton *)sender
{

    [self.linesCompleted removeAllObjects];
    [self setNeedsDisplay];
}
- (void)eraser:(UIButton *)sender
{
    self.drawColor = [UIColor whiteColor];
    [self setNeedsDisplay];
    
}
- (void)save:(UIButton *)sender
{
    //保存瞬间把view上的所有按钮的Alpha值改为０
    [[self subviews] makeObjectsPerformSelector:@selector (setAlpha:)];
    
    UIGraphicsBeginImageContext(self.bounds.size);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage* image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    //遍历view全部按钮在把他们改为１
    for (UIView* temp in [self subviews])
    {
        [temp setAlpha:1.0];
    }
}
//-(void)callCemera:(UIButton *)sender
//{
//    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
//    //判断如果摄像机不能用图片来源与图片库
//    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {
//        sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
//    }
//    UIImagePickerController *picker=[[UIImagePickerController alloc] init];
//    picker.delegate=self;
//    //前后摄像机
//    //picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
//    picker.allowsEditing=YES;
//    picker.sourceType=sourceType;
//    [self presentModalViewController:picker animated:YES];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
