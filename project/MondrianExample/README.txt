http://type-exit.org/adventures-with-open-source-bi/2010/07/creating-a-basic-mondrian-olap-cube/23-Apr-2011 7:53:12 PM org.apache.catalina.core.AprLifecycleListener init
INFO: Loaded APR based Apache Tomcat Native library 1.1.20.
23-Apr-2011 7:53:12 PM org.apache.catalina.core.AprLifecycleListener init
INFO: APR capabilities: IPv6 [true], sendfile [true], accept filters [false], ra
ndom [true].
23-Apr-2011 7:53:18 PM org.apache.coyote.AbstractProtocolHandler init
INFO: Initializing ProtocolHandler ["http-apr-8080"]
23-Apr-2011 7:53:18 PM org.apache.coyote.AbstractProtocolHandler init
INFO: Initializing ProtocolHandler ["ajp-apr-8009"]
23-Apr-2011 7:53:18 PM org.apache.catalina.startup.Catalina load
INFO: Initialization processed in 9412 ms
23-Apr-2011 7:53:18 PM org.apache.catalina.core.StandardService startInternal
INFO: Starting service Catalina
23-Apr-2011 7:53:18 PM org.apache.catalina.core.StandardEngine startInternal
INFO: Starting Servlet Engine: Apache Tomcat/7.0.12
23-Apr-2011 7:53:18 PM org.apache.catalina.startup.HostConfig deployDirectory
INFO: Deploying web application directory docs


        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1033)
        at org.apache.catalina.core.StandardEngine.startInternal(StandardEngine.
java:291)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardService.startInternal(StandardServic
e.java:443)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardServer.startInternal(StandardServer.
java:727)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.startup.Catalina.start(Catalina.java:620)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.
java:39)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAcces
sorImpl.java:25)
        at java.lang.reflect.Method.invoke(Method.java:597)
        at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:303)
        at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:431)
23-Apr-2011 7:53:25 PM org.apache.catalina.startup.HostConfig deployDirectory
INFO: Deploying web application directory examples
23-Apr-2011 7:53:25 PM org.apache.catalina.startup.HostConfig deployDirectory
SEVERE: Error deploying web application directory examples
java.lang.NoSuchMethodError: javax.servlet.ServletContext.getSessionCookieConfig
()Ljavax/servlet/SessionCookieConfig;
        at org.apache.catalina.deploy.WebXml.configureContext(WebXml.java:1281)
        at org.apache.catalina.startup.ContextConfig.webConfig(ContextConfig.jav
a:1286)
        at org.apache.catalina.startup.ContextConfig.configureStart(ContextConfi
g.java:882)
        at org.apache.catalina.startup.ContextConfig.lifecycleEvent(ContextConfi
g.java:317)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.core.StandardContext.startInternal(StandardContex
t.java:5081)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase
.java:812)
        at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:78
7)
        at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:607)

        at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.jav
a:1055)
        at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.j
ava:978)
        at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:472
)
        at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1322)
        at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java
:311)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.util.LifecycleBase.setStateInternal(LifecycleBase
.java:379)
        at org.apache.catalina.util.LifecycleBase.setState(LifecycleBase.java:32
4)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1041)
        at org.apache.catalina.core.StandardHost.startInternal(StandardHost.java
:774)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1033)
        at org.apache.catalina.core.StandardEngine.startInternal(StandardEngine.
java:291)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardService.startInternal(StandardServic
e.java:443)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardServer.startInternal(StandardServer.
java:727)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.startup.Catalina.start(Catalina.java:620)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.
java:39)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAcces
sorImpl.java:25)
        at java.lang.reflect.Method.invoke(Method.java:597)
        at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:303)
        at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:431)
23-Apr-2011 7:53:25 PM org.apache.catalina.startup.HostConfig deployDirectory
INFO: Deploying web application directory host-manager
23-Apr-2011 7:53:26 PM org.apache.catalina.startup.HostConfig deployDirectory
SEVERE: Error deploying web application directory host-manager
java.lang.NoSuchMethodError: javax.servlet.ServletContext.getSessionCookieConfig
()Ljavax/servlet/SessionCookieConfig;
        at org.apache.catalina.deploy.WebXml.configureContext(WebXml.java:1281)
        at org.apache.catalina.startup.ContextConfig.webConfig(ContextConfig.jav
a:1286)
        at org.apache.catalina.startup.ContextConfig.configureStart(ContextConfi
g.java:882)
        at org.apache.catalina.startup.ContextConfig.lifecycleEvent(ContextConfi
g.java:317)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.core.StandardContext.startInternal(StandardContex
t.java:5081)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase
.java:812)
        at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:78
7)
        at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:607)

        at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.jav
a:1055)
        at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.j
ava:978)
        at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:472
)
        at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1322)
        at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java
:311)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.util.LifecycleBase.setStateInternal(LifecycleBase
.java:379)
        at org.apache.catalina.util.LifecycleBase.setState(LifecycleBase.java:32
4)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1041)
        at org.apache.catalina.core.StandardHost.startInternal(StandardHost.java
:774)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1033)
        at org.apache.catalina.core.StandardEngine.startInternal(StandardEngine.
java:291)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardService.startInternal(StandardServic
e.java:443)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardServer.startInternal(StandardServer.
java:727)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.startup.Catalina.start(Catalina.java:620)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.
java:39)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAcces
sorImpl.java:25)
        at java.lang.reflect.Method.invoke(Method.java:597)
        at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:303)
        at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:431)
23-Apr-2011 7:53:26 PM org.apache.catalina.startup.HostConfig deployDirectory
INFO: Deploying web application directory manager
23-Apr-2011 7:53:26 PM org.apache.catalina.startup.HostConfig deployDirectory
SEVERE: Error deploying web application directory manager
java.lang.NoSuchMethodError: javax.servlet.ServletContext.getSessionCookieConfig
()Ljavax/servlet/SessionCookieConfig;
        at org.apache.catalina.deploy.WebXml.configureContext(WebXml.java:1281)
        at org.apache.catalina.startup.ContextConfig.webConfig(ContextConfig.jav
a:1286)
        at org.apache.catalina.startup.ContextConfig.configureStart(ContextConfi
g.java:882)
        at org.apache.catalina.startup.ContextConfig.lifecycleEvent(ContextConfi
g.java:317)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.core.StandardContext.startInternal(StandardContex
t.java:5081)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase
.java:812)
        at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:78
7)
        at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:607)

        at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.jav
a:1055)
        at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.j
ava:978)
        at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:472
)
        at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1322)
        at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java
:311)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.util.LifecycleBase.setStateInternal(LifecycleBase
.java:379)
        at org.apache.catalina.util.LifecycleBase.setState(LifecycleBase.java:32
4)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1041)
        at org.apache.catalina.core.StandardHost.startInternal(StandardHost.java
:774)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1033)
        at org.apache.catalina.core.StandardEngine.startInternal(StandardEngine.
java:291)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardService.startInternal(StandardServic
e.java:443)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardServer.startInternal(StandardServer.
java:727)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.startup.Catalina.start(Catalina.java:620)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.
java:39)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAcces
sorImpl.java:25)
        at java.lang.reflect.Method.invoke(Method.java:597)
        at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:303)
        at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:431)
23-Apr-2011 7:53:26 PM org.apache.catalina.startup.HostConfig deployDirectory
INFO: Deploying web application directory ROOT
23-Apr-2011 7:53:26 PM org.apache.catalina.startup.HostConfig deployDirectory
SEVERE: Error deploying web application directory ROOT
java.lang.NoSuchMethodError: javax.servlet.ServletContext.getSessionCookieConfig
()Ljavax/servlet/SessionCookieConfig;
        at org.apache.catalina.deploy.WebXml.configureContext(WebXml.java:1281)
        at org.apache.catalina.startup.ContextConfig.webConfig(ContextConfig.jav
a:1286)
        at org.apache.catalina.startup.ContextConfig.configureStart(ContextConfi
g.java:882)
        at org.apache.catalina.startup.ContextConfig.lifecycleEvent(ContextConfi
g.java:317)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.core.StandardContext.startInternal(StandardContex
t.java:5081)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase
.java:812)
        at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:78
7)
        at org.apache.catalina.core.StandardHost.addChild(StandardHost.java:607)

        at org.apache.catalina.startup.HostConfig.deployDirectory(HostConfig.jav
a:1055)
        at org.apache.catalina.startup.HostConfig.deployDirectories(HostConfig.j
ava:978)
        at org.apache.catalina.startup.HostConfig.deployApps(HostConfig.java:472
)
        at org.apache.catalina.startup.HostConfig.start(HostConfig.java:1322)
        at org.apache.catalina.startup.HostConfig.lifecycleEvent(HostConfig.java
:311)
        at org.apache.catalina.util.LifecycleSupport.fireLifecycleEvent(Lifecycl
eSupport.java:119)
        at org.apache.catalina.util.LifecycleBase.fireLifecycleEvent(LifecycleBa
se.java:89)
        at org.apache.catalina.util.LifecycleBase.setStateInternal(LifecycleBase
.java:379)
        at org.apache.catalina.util.LifecycleBase.setState(LifecycleBase.java:32
4)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1041)
        at org.apache.catalina.core.StandardHost.startInternal(StandardHost.java
:774)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.ContainerBase.startInternal(ContainerBase.ja
va:1033)
        at org.apache.catalina.core.StandardEngine.startInternal(StandardEngine.
java:291)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardService.startInternal(StandardServic
e.java:443)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.core.StandardServer.startInternal(StandardServer.
java:727)
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:145)
        at org.apache.catalina.startup.Catalina.start(Catalina.java:620)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.
java:39)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAcces
sorImpl.java:25)
        at java.lang.reflect.Method.invoke(Method.java:597)
        at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:303)
        at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:431)
23-Apr-2011 7:53:26 PM org.apache.coyote.AbstractProtocolHandler start
INFO: Starting ProtocolHandler ["http-apr-8080"]
23-Apr-2011 7:53:26 PM org.apache.coyote.AbstractProtocolHandler start
INFO: Starting ProtocolHandler ["ajp-apr-8009"]
23-Apr-2011 7:53:26 PM org.apache.catalina.startup.Catalina start
INFO: Server startup in 8134 ms

.;"C:\Program Files (x86)\QuickTime\QTSystem\QTJava.zip"
