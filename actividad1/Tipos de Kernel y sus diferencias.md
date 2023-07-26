# Kernel
El núcleo o kernel es el componente central de un sistema operativo que gestiona las operaciones de la computadora y el hardware. Básicamente, administra las operaciones de memoria y el tiempo de CPU. Es el componente principal de un sistema operativo. El núcleo actúa como un puente entre las aplicaciones y el procesamiento de datos realizado a nivel de hardware mediante la comunicación entre procesos y las llamadas al sistema.

# Tipos de Kernel y sus diferencias

## Kernel Monolítico
Es uno de los tipos de núcleos en los cuales todos los servicios del sistema operativo operan en el espacio del núcleo. Tiene dependencias entre los componentes del sistema y contiene una gran cantidad de líneas de código, lo que lo hace complejo.

Ejemplo:

Unix, Linux, Open VMS, XTS-400, etc.

## Microkernel
Es un tipo de núcleo que sigue un enfoque minimalista. Tiene memoria virtual y programación de hilos. Es más estable con menos servicios en el espacio del núcleo. Coloca el resto en el espacio de usuario.

Se utiliza en sistemas operativos pequeños.

Ejemplo:

Mach, L4, AmigaOS, Minix, K42, etc.

## Kernel híbrido
Es la combinación tanto del núcleo monolítico como del microkernel. Tiene la velocidad y el diseño del núcleo monolítico, y la modularidad y estabilidad del microkernel.

Ejemplo:

Windows NT, Netware, BeOS, etc.

## Exokernel
Es un tipo de núcleo que sigue el principio de punto a punto. Tiene el menor número posible de abstracciones de hardware. Asigna recursos físicos a las aplicaciones.

Ejemplo:

Nemesis, ExOS, etc.