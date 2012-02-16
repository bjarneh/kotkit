
    · K O T K I T ·

    kotlin starter kit for non-IDE folks


This repo contains a small starter-kit for those who want to try out
the [Kotlin][1] language without the [Intellij IDE][2].
Very basic syntax files for [Vim][3] and [Nano][4] can be
found inside the **misc** directory. And a script that helps you
build executables can be found inside the **bin** directory.


#### Compile

Compilation requires that the kotlin compiler has been installed
naturally, see [kotlin's github page][5] for a howto.

To use the utility script (**kz**), a variable needs to be set
to point at the root directory of kotlin (as checked out from github)

**KOTLIN_GITROOT**
    
    $ git clone https://github.com/JetBrains/kotlin.git
    $ export KOTLIN_GITROOT=$PWD/kotlin

should do the trick.

This variable could typically be set inside a file which is read each
time you log in (**.profile** or **.bashrc** etc..)

#### kz

In order to use the Python script **kz** to help you compile kotlin, 
it must be located somewhere it can be found; i.e. in one of the 
directories pointed to by the `$PATH` variable typically.


#### Example

Compiling a single file

    $ cat Main.kt

     fun main(args: Array<String>){
         println("hello world!")
     }

    $ kz Main.kt -o program
      compiling: Main.kt
      construct: program
      time used: 3.4 s

    $ ./program
      hello world!


Compiling a project with multiple files

    $ ls src/
    Hello.kt  Main.kt

    $ cat src/Main.kt

    fun main(args: Array<String>){
        val h = Hello("world!")
        h.say()
    }

    $ cat src/Hello.kt

    class Hello(val whom: String){
        fun say() = println("hello $whom")
    }

    $ kz -o program src/
      compiling: Main.kt
      compiling: Hello.kt
      construct: program
      time used: 4.4 s

    $ ./program
      hello world!

If source is place inside a directory named `src` as in the example,
the `src` can be omitted, this is the default location.


#### Vim

To get syntax highlighting is hopefully straightforward,
create a symbolic link or copy the syntax file into your
syntax folder `$HOME/.vim/syntax/kotlin.syn`, then add a
file recognition pattern to your **.vimrc**

    " kotlin files
    au BufRead,BufNewFile *.kt set filetype=kotlin


#### Nano

Put this inside your **.nanorc**

    include "/path/to/kotkit/mics/syntax/nano/kotlin.nanorc"


[1]: http://confluence.jetbrains.net/display/Kotlin/Welcome "Kotlin homepage"
[2]: http://www.jetbrains.com/idea/ "Intellij homepage"
[3]: http://vim.org  "Vim homepage"
[4]: http://www.nano-editor.org/ "Nano homepage"
[5]: https://github.com/JetBrains/kotlin "Kotlin on github"
