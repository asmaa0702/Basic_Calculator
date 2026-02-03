import 'dart:ffi';

import 'package:flutter/material.dart';
import 'functions.dart';
import 'button.dart';

class Calc extends StatefulWidget {
  Calc({super.key});
  double? a, b;
  String dis = '0';
  bool disStat = false;
  bool Adot = false, Bdot = false;
  String last = '';
  String? sign;

  double x = 0;
  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15173D),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              width: 340,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF1E9E9),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Text(
                widget.dis,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff15173D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Column(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //1st row
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //AC
                        MyButton(
                          color: const Color(0xFFF1E9E9),

                          child: Text(
                            'AC',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF982598),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              widget.dis = '0';
                              widget.Adot = false;
                              widget.Bdot = false;
                              widget.disStat = false;
                              widget.a = null;
                              widget.b = null;
                              widget.last = '';
                              widget.x = 0;
                              widget.sign = null;
                            });
                          },
                        ),

                        //delete
                        MyButton(
                          color: const Color(0xFFF1E9E9),
                          child: Icon(
                            Icons.backspace,
                            color: const Color(0xFF982598),
                            size: 20,
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.dis.length > 1 &&
                                  widget.dis.isNotEmpty) {
                                widget.dis = widget.dis.substring(
                                  0,
                                  widget.dis.length - 1,
                                );
                              } else {
                                widget.dis = '0';
                              }
                            });
                          },
                        ),

                        //divide
                        MyButton(
                          color: const Color(0xFF982598),
                          child: Text(
                            '/',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.b == null) {
                                if (widget.sign == null) {
                                  widget.sign = '/';
                                  widget.a = double.parse(widget.dis);
                                  widget.dis = widget.dis + '/';
                                } else {
                                  widget.dis = widget.dis.substring(
                                    0,
                                    widget.dis.length - 1,
                                  );
                                  widget.sign = '/';
                                  widget.a = double.parse(widget.dis);
                                  widget.dis = widget.dis + '/';
                                }
                              } else {
                                if (widget.sign == '/') {
                                  widget.x = div(widget.a!, widget.b!);
                                  if (widget.x != -1) {
                                    widget.dis = widget.x.toString();
                                  } else {
                                    widget.dis = "Denominator can't be zero";
                                  }
                                } else if (widget.sign == '+') {
                                  widget.x = add(widget.a!, widget.b!);
                                  widget.dis = widget.x.toString();
                                } else if (widget.sign == '-') {
                                  widget.x = sub(widget.a!, widget.b!);
                                  widget.dis = widget.x.toString();
                                } else if (widget.sign == '×') {
                                  widget.x = mult(widget.a!, widget.b!);
                                  widget.dis = widget.x.toString();
                                } else {
                                  widget.dis = widget.dis;
                                }
                                widget.disStat = true;
                                widget.Adot = false;
                                widget.Bdot = false;
                                widget.a = widget.x;
                                widget.b = null;
                                widget.last = '';
                                widget.x = 0;
                                widget.sign = '/';
                                widget.a = double.parse(widget.dis);
                                widget.dis = widget.dis + '/';
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    //2nd row
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //===============7====================
                        MyButton(
                          child: Text(
                            '7',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '7';
                                } else {
                                  widget.dis = widget.dis + '7';
                                }
                              } else {
                                widget.last += '7';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '7';
                              }
                            });
                          },
                        ),

                        //8
                        MyButton(
                          child: Text(
                            '8',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '8';
                                } else {
                                  widget.dis = widget.dis + '8';
                                }
                              } else {
                                widget.last += '8';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '8';
                              }
                            });
                          },
                        ),

                        //9
                        MyButton(
                          child: Text(
                            '9',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '9';
                                } else {
                                  widget.dis = widget.dis + '9';
                                }
                              } else {
                                widget.last += '9';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '9';
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    //3rd
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //===============4====================
                        MyButton(
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '4';
                                } else {
                                  widget.dis = widget.dis + '4';
                                }
                              } else {
                                widget.last += '4';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '4';
                              }
                            });
                          },
                        ),

                        //5
                        MyButton(
                          child: Text(
                            '5',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '5';
                                } else {
                                  widget.dis = widget.dis + '5';
                                }
                              } else {
                                widget.last += '5';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '5';
                              }
                            });
                          },
                        ),

                        //6
                        MyButton(
                          child: Text(
                            '6',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '6';
                                } else {
                                  widget.dis = widget.dis + '6';
                                }
                              } else {
                                widget.last += '6';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '6';
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    //4th
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //===============1====================
                        MyButton(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '1';
                                } else {
                                  widget.dis = widget.dis + '1';
                                }
                              } else {
                                widget.last += '1';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '1';
                              }
                            });
                          },
                        ),

                        //2
                        MyButton(
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '2';
                                } else {
                                  widget.dis = widget.dis + '2';
                                }
                              } else {
                                widget.last += '2';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '2';
                              }
                            });
                          },
                        ),

                        //3
                        MyButton(
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '3';
                                } else {
                                  widget.dis = widget.dis + '3';
                                }
                              } else {
                                widget.last += '3';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '3';
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    //5th
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //===============1====================
                        MyButton(
                          w: 150,
                          color: const Color(0xFFF1E9E9),

                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF982598),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (widget.dis == '0') {
                                  widget.dis = '0';
                                } else {
                                  widget.dis = widget.dis + '0';
                                }
                              } else {
                                widget.last += '0';
                                widget.b = double.parse(widget.last);
                                widget.dis = widget.dis + '0';
                              }
                            });
                          },
                        ),

                        //2
                        MyButton(
                          sign: '.',
                          child: Text(
                            '.',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFF1E9E9),
                            ),
                          ),
                          onPress: () {
                            setState(() {
                              if (widget.sign == null) {
                                if (!widget.Adot) {
                                  widget.dis = widget.dis + '.';
                                  widget.Adot = true;
                                }
                              } else {
                                if (!widget.Bdot) {
                                  widget.last += '.';
                                  widget.b = double.parse(widget.last);
                                  widget.dis = widget.dis + '.';
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //multi
                    MyButton(
                      sign: '×',
                      color: const Color(0xFF982598),
                      child: Icon(Icons.clear, color: const Color(0xFFF1E9E9)),
                      onPress: () {
                        setState(() {
                          if (widget.b == null) {
                            if (widget.sign == null) {
                              widget.sign = '×';
                              widget.a = double.parse(widget.dis);
                              widget.dis = widget.dis + '×';
                            } else {
                              widget.dis = widget.dis.substring(
                                0,
                                widget.dis.length - 1,
                              );
                              widget.sign = '×';
                              widget.a = double.parse(widget.dis);
                              widget.dis = widget.dis + '×';
                            }
                          } else {
                            if (widget.sign == '/') {
                              widget.x = div(widget.a!, widget.b!);
                              if (widget.x != -1) {
                                widget.dis = widget.x.toString();
                              } else {
                                widget.dis = "Denominator can't be zero";
                              }
                            } else if (widget.sign == '+') {
                              widget.x = add(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else if (widget.sign == '-') {
                              widget.x = sub(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else if (widget.sign == '×') {
                              widget.x = mult(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else {
                              widget.dis = widget.dis;
                            }
                            widget.disStat = true;
                            widget.Adot = false;
                            widget.Bdot = false;
                            widget.a = widget.x;
                            widget.b = null;
                            widget.last = '';
                            widget.x = 0;
                            widget.sign = '×';
                            widget.a = double.parse(widget.dis);
                            widget.dis = widget.dis + '×';
                          }
                        });
                      },
                    ),
                    //sub
                    MyButton(
                      sign: '-',
                      color: const Color(0xFF982598),
                      child: Icon(Icons.remove, color: const Color(0xFFF1E9E9)),
                      onPress: () {
                        setState(() {
                          if (widget.b == null) {
                            if (widget.sign == null) {
                              widget.sign = '-';
                              widget.a = double.parse(widget.dis);
                              widget.dis = widget.dis + '-';
                            } else {
                              widget.dis = widget.dis.substring(
                                0,
                                widget.dis.length - 1,
                              );
                              widget.sign = '-';
                              widget.a = double.parse(widget.dis);
                              widget.dis = widget.dis + '-';
                            }
                          } else {
                            if (widget.sign == '/') {
                              widget.x = div(widget.a!, widget.b!);
                              if (widget.x != -1) {
                                widget.dis = widget.x.toString();
                              } else {
                                widget.dis = "Denominator can't be zero";
                              }
                            } else if (widget.sign == '+') {
                              widget.x = add(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else if (widget.sign == '-') {
                              widget.x = sub(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else if (widget.sign == '×') {
                              widget.x = mult(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else {
                              widget.dis = widget.dis;
                            }
                            widget.disStat = true;
                            widget.Adot = false;
                            widget.Bdot = false;
                            widget.a = widget.x;
                            widget.b = null;
                            widget.last = '';
                            widget.x = 0;
                            widget.sign = '-';
                            widget.a = double.parse(widget.dis);
                            widget.dis = widget.dis + '-';
                          }
                        });
                      },
                    ),
                    //pluse
                    MyButton(
                      sign: '+',
                      h: 105,
                      color: const Color(0xFF982598),
                      child: Icon(Icons.add, color: const Color(0xFFF1E9E9)),
                      onPress: () {
                        setState(() {
                          if (widget.b == null) {
                            if (widget.sign == null) {
                              widget.sign = '+';
                              widget.a = double.parse(widget.dis);
                              widget.dis = widget.dis + '+';
                            } else {
                              widget.dis = widget.dis.substring(
                                0,
                                widget.dis.length - 1,
                              );
                              widget.sign = '+';
                              widget.a = double.parse(widget.dis);
                              widget.dis = widget.dis + '+';
                            }
                          } else {
                            if (widget.sign == '/') {
                              widget.x = div(widget.a!, widget.b!);
                              if (widget.x != -1) {
                                widget.dis = widget.x.toString();
                              } else {
                                widget.dis = "Denominator can't be zero";
                              }
                            } else if (widget.sign == '+') {
                              widget.x = add(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else if (widget.sign == '-') {
                              widget.x = sub(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else if (widget.sign == '×') {
                              widget.x = mult(widget.a!, widget.b!);
                              widget.dis = widget.x.toString();
                            } else {
                              widget.dis = widget.dis;
                            }
                            widget.disStat = true;
                            widget.Adot = false;
                            widget.Bdot = false;
                            widget.a = widget.x;
                            widget.b = null;
                            widget.last = '';
                            widget.x = 0;
                            widget.sign = '+';
                            widget.a = double.parse(widget.dis);
                            widget.dis = widget.dis + '+';
                          }
                        });
                      },
                    ),
                    MyButton(
                      h: 105,
                      color: const Color(0xFF982598),
                      child: Icon(
                        Icons.drag_handle,
                        color: const Color(0xFFF1E9E9),
                      ),
                      onPress: () {
                        setState(() {
                          if (widget.sign == '/') {
                            widget.x = div(widget.a!, widget.b!);
                            if (widget.x != -1) {
                              widget.dis = widget.x.toString();
                            } else {
                              widget.dis = "Denominator can't be zero";
                            }
                          } else if (widget.sign == '+') {
                            widget.x = add(widget.a!, widget.b!);
                            widget.dis = widget.x.toString();
                          } else if (widget.sign == '-') {
                            widget.x = sub(widget.a!, widget.b!);
                            widget.dis = widget.x.toString();
                          } else if (widget.sign == '×') {
                            widget.x = mult(widget.a!, widget.b!);
                            widget.dis = widget.x.toString();
                          } else {
                            widget.dis = widget.dis;
                          }
                          widget.disStat = true;
                          widget.Adot = false;
                          widget.Bdot = false;
                          widget.a = widget.x;
                          widget.b = null;
                          widget.last = '';
                          widget.x = 0;
                          widget.sign = null;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
