import java.{util => ju}
import scala.util.{Try,Failure,Success}
import scala.concurrent.Future
import scala.concurrent.duration.DurationInt
import scala.concurrent.ExecutionContext.Implicits.global
// interp.load.ivy("com.lihaoyi" %% "ammonite-shell" % ammonite.Constants.version)
@
//val shellSession = ammonite.shell.ShellSession()
// import shellSession._
// import ammonite.shell.PPrints._
import ammonite.ops._
// import ammonite.shell._
// ammonite.shell.Configure(repl, wd)
repl.prompt() = "\ue737 "

def lines(file: String): Iterator[String] = {
  scala.io.Source.fromFile(file.replace("~/", "/Users/iantabolt/"))
    .getLines()
}

def tsvLines(file: String): Iterator[Array[String]] = {
  lines(file).map(_.split("\t", Int.MaxValue))
}

import java.io.{PrintStream, FileOutputStream, File}
def writer(file: String, append: Boolean = true, tee: Option[PrintStream] = Some(System.out)): PrintStream = {
  new PrintStream(new FileOutputStream(new File(file.replace("~/", "/Users/iantabolt/")), append)) {
    override def print(str: String): Unit = {
      tee.foreach(_.print(str))
      super.print(str)
    }
  }
}

import $ivy.`org.json4s::json4s-native:3.5.3`
import org.json4s._
import org.json4s.native.JsonMethods._

def jsonLines(file: String): Iterator[JObject] = {
  lines(file).map(parse(_).asInstanceOf[JObject])
}
