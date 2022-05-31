# `qDebug()` not showing output
Navigate to the following location:
Qt creator > Tools > Options > Kits, select your kit, find Environment, click change and add
```console
QT_ASSUME_STDERR_HAS_CONSOLE=1
```
## Debug Options
```console
qDebug() << x;
qWarning() << "Let me warn you";
qInfo() << "Just FYI!";
qCritical() << "The end is near!";
qFatal() << "Ok here it is!";
```
`qFatal()` sends a kill signal to the running application

# Convert an integer to string and vice-versa
```console
QString::number(integer);  
string.toInt();
```

# Convert a char to integer
```console
charvalue.digitValue();
```

# Quick view of widget
Key shortcut:
```console
M-S-r
```

# Signal Slot Connection Example (Static Methods on `QObjects`)
1. __A__ = Who is emitting the signal: **Emitter**
2. __B__ = Which signal is being emitted: **Message**
3. __C__ = Who is implementing the slot or method that we connect to: **Receiver**
4. __D__ = Which method are we connecting to: **Response**
In general the connection will have the following form:

```console
connect(Emitter, &Emitter::valueChanged, Receiver, &Receiver::updateValue);
```

## Signal Slot Connection Variants:
### The Second and Fourth are pointer to member functions (Functor: Function Pointers)
```console
connect(const QObject * emitter, PointerToMemberFunction signal, const QObject * receiver, PointerToMemberFunction method);
QObject::connect(slider, &QSlider::valueChanged, spin, &QSpinBox::setValue);
```
### The Second and Fourth are regular strings (Macro based)
```console
connect(const QObject * emitter, const char * signal, const QObject * receiver, const char * method);
QObject::connect(slider, SIGNAL(valueChanged(int)) , spin, SLOT(setValue(int));
```
The disadvantage from the Macro based is that you do not get compilation errors!
### There is only three parameters where the third one is a lambda functions
```console
connect(const QObject * emitter, PointerToMemberFunction signal, Functor functor);
QPushButton *button = new QPushButoon("Press Me!");
QObject::connect(button, &QPushButton::pressed, [button] { button->setText("Release Me!");});
```

- Example 1
For example if we want a line edit pass the info to another line edit:
```console
connect(ui->m_lineEdit1, &QLineEdit::textChanged, [=]{QLineEdit::textChanged(m_lineEdit1->text());});
```
The above example has only three elements, which then has the following form:
```connect
connect(Sender, &Sender::valueChanged, &Receiver::updateValue);
```
We can tell that the receiver is optional and is up to the `&Receiver` to determine
which objects is/are the receiver(s) in its implementation.

- Example 2
```console
connect(this->m_firstValue, &QLineEdit::textChanged, this->m_result ,[=]{valueChanged(m_firstValue->text(), m_secondValue->text());});
```
In the above example are the most common four arguments for a connection. Omission of the third arguments flags a warning using
the Clang compiler. Try to always implement the third argument when working with lambda expressions.

**Note:** The symbol `[=]` is the lambda-introducer in the C++ notation.

## Parts of a Lambda function (properties):

`[=] () mutable throw() -> int 
{
  int n = x + y;
  x = y; y = n;
  return n;
}`

1. `[=]` is the lambda-introducer in the C++ notation.
2. `()` lambda-declarator to list parameters (__optional__)
3. `mutable` mutable specification (__optional__)
4. `throw()` exception specification (__optional__)
5. `-> int` return specification (__optional__)
6. `{ ... }` lambda body.


## Change the cc compiler of your system
Check the line before depending on your system
```console
cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang ..
```

## Check your `CCache` statistics
```console
ccache -s
```

## Pre Compiled Header Support (`PHC`)
Make sure you have pre-compile header support ON
If you have pre compiled header support then include a file (e.g `KDABViewer_pch.h`) following headers:
```console
#pragma once

#include <QApplication>
#include <QBoxLayout>
#include <QLabel
#include <QVariant>
#include <QWidget>
#include <memory>
```

# Some theory: 
1. Applications without UI should use `QCoreApplication` instead of `QApplication`
2.
