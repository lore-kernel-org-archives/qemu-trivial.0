Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnuvL-0003xR-VZ
	for mharc-qemu-trivial@gnu.org; Mon, 31 May 2021 23:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lntV4-0005S8-2B
 for qemu-trivial@nongnu.org; Mon, 31 May 2021 21:47:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lntV1-0005fI-Og
 for qemu-trivial@nongnu.org; Mon, 31 May 2021 21:47:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso490255wmi.3
 for <qemu-trivial@nongnu.org>; Mon, 31 May 2021 18:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hVzdzbb8GVsVCXn3Me44FSGiP/knRo1iN1KKR+WEpE=;
 b=fkNtQVOcP0nmZOJ18bh64/KKxFNZ/b4qada8RcRrwreiSedGUZIK4oMSA2MQ514qoK
 brDvlJxiKroR5lqNXfzYG+lvOB7qVET6cUVxEPxbuCBge9VnuHWBh0qhcBHSrbh4lDYz
 IG+PYLIUXIVudqahtX/TU6lu1EWpJxuze9f2zxdcKchazIl/IpzQhvg2bCd/YjAUc0GE
 V04bBsby1mQaIb1B7FhKMg+X3qB+kjqNG0Odh1gkA73OTlLwCltij7kPVEcjElkV5S16
 XNf8iaKlNzPSQYeU8Py51qDwOte3KWTU4gpWjN4Ccw5onxq6kQ7kYzhUtDsDNRvmQNjr
 1f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hVzdzbb8GVsVCXn3Me44FSGiP/knRo1iN1KKR+WEpE=;
 b=XkV28Qvy5/PYEyW5IPzF2aAVUBcLU8okt3ntlCi1rtHF6FxhNKkM2VGBWtEsfMNH5Q
 A51J/1Xh/6+bEuW1YEUYChifHwMySaUJZp6Ib23l2ewTSpHpkZl11TX3v5d2N9U0RXeC
 Yusn/Di0q6cuGV8LUBP4GrPgj9JdOXpL/hvpp0CFKPqsMtFhlz2xoNKBuaxCDuExnSHW
 Q3ClIHojYgqZvzqojkTcUYZY48V/Ksrmp8o6ifZVZ6nrwlLmyI1lMKvjf0uG3jLObR+I
 19IbyZpWwRJNRlvKvZK7ShtvUJNO+VuHc9uhEzm5MbjLsnPFWHx4xqEwPCqI740y7H2i
 AThQ==
X-Gm-Message-State: AOAM533SZd6B4hUq634E/MncKVkEEFcR0ZTmUFATzbThx61oQsReVqra
 YBsNsDMhMcf1nIuszFCzpPqLJw==
X-Google-Smtp-Source: ABdhPJwr5e6sAMfVHe1hY+0bKaHTrG+9rm9VizLOv3u7dlIQzce3gBqbcUcAXMq+ToS45MbEO/z/Eg==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr23357405wmh.135.1622512037300; 
 Mon, 31 May 2021 18:47:17 -0700 (PDT)
Received: from pythagoras.localdomain ([154.187.234.222])
 by smtp.gmail.com with ESMTPSA id f5sm1483266wrf.22.2021.05.31.18.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 18:47:16 -0700 (PDT)
From: email@aabouzied.com
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Ahmed Abouzied <email@aabouzied.com>
Subject: [PATCH] Add display suboptions to man pages
Date: Tue,  1 Jun 2021 03:43:13 +0200
Message-Id: <20210601014312.17981-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32f;
 envelope-from=email@aabouzied.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 May 2021 23:18:34 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jun 2021 01:47:22 -0000

From: Ahmed Abouzied <email@aabouzied.com>

Updates man pages with the suboptions for the `-display`.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/128
Buglink: https://bugs.launchpad.net/qemu/+bug/1620660

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---

This is just a trivial update for the man pages. It's the first time I
get to know QEMU source code. I didn't know which maintainer to CC here.
The `scripts/get_maintainer.pl` script didn't show any maintainers for
this file. I did CC the trivial mailing list because this is a very
small change.

Please let me know if the patch format is incorrect or something and
I'll fix it.

Looking forward to getting back feedback.

Thanks

---
 qemu-options.hx | 71 ++++++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..587cd7786d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -227,15 +227,15 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     QEMU_ARCH_ALL)
 SRST
 ``-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=initiator]``
-  \ 
+  \
 ``-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=initiator]``
   \
 ``-numa dist,src=source,dst=destination,val=distance``
-  \ 
+  \
 ``-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]``
-  \ 
+  \
 ``-numa hmat-lb,initiator=node,target=node,hierarchy=hierarchy,data-type=tpye[,latency=lat][,bandwidth=bw]``
-  \ 
+  \
 ``-numa hmat-cache,node-id=node,size=size,level=level[,associativity=str][,policy=str][,line=size]``
     Define a NUMA node and assign RAM and VCPUs to it. Set the NUMA
     distance from a source node to a destination node. Set the ACPI
@@ -430,7 +430,7 @@ DEF("global", HAS_ARG, QEMU_OPTION_global,
     QEMU_ARCH_ALL)
 SRST
 ``-global driver.prop=value``
-  \ 
+  \
 ``-global driver=driver,property=property,value=value``
     Set default value of driver's property prop to value, e.g.:
 
@@ -976,9 +976,9 @@ SRST
 ``-hda file``
   \
 ``-hdb file``
-  \ 
+  \
 ``-hdc file``
-  \ 
+  \
 ``-hdd file``
     Use file as hard disk 0, 1, 2 or 3 image (see the :ref:`disk images`
     chapter in the System Emulation Users Guide).
@@ -1468,7 +1468,7 @@ DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
 
 SRST
 ``-fsdev local,id=id,path=path,security_model=security_model [,writeout=writeout][,readonly=on][,fmode=fmode][,dmode=dmode] [,throttling.option=value[,throttling.option=value[,...]]]``
-  \ 
+  \
 ``-fsdev proxy,id=id,socket=socket[,writeout=writeout][,readonly=on]``
   \
 ``-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=writeout][,readonly=on]``
@@ -1589,9 +1589,9 @@ DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
 
 SRST
 ``-virtfs local,path=path,mount_tag=mount_tag ,security_model=security_model[,writeout=writeout][,readonly=on] [,fmode=fmode][,dmode=dmode][,multidevs=multidevs]``
-  \ 
+  \
 ``-virtfs proxy,socket=socket,mount_tag=mount_tag [,writeout=writeout][,readonly=on]``
-  \ 
+  \
 ``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly=on]``
   \
 ``-virtfs synth,mount_tag=mount_tag``
@@ -1819,11 +1819,22 @@ SRST
     old style -sdl/-curses/... options. Use ``-display help`` to list
     the available display types. Valid values for type are
 
-    ``sdl``
+    ``spice-app[,gl=on|off]``
+        Start QEMU as a Spice server and launch the default Spice client
+        application. The Spice server will redirect the serial consoles
+        and QEMU monitors. (Since 4.0)
+
+    ``sdl[,alt_grab=on|off][,ctrl_grab=on|off][,window_close=on|off][,gl=on|core|es|off]``
+
         Display video output via SDL (usually in a separate graphics
         window; see the SDL documentation for other possibilities).
 
-    ``curses``
+    ``gtk[,grab_on_hover=on|off][,gl=on|off]``
+        Display video output in a GTK window. This interface provides
+        drop-down menus and other UI elements to configure and control
+        the VM during runtime.
+
+    ``curses [,charset=<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
         curses/ncurses interface. Nothing is displayed when the graphics
@@ -1834,6 +1845,14 @@ SRST
         ``charset=CP850`` for IBM CP850 encoding. The default is
         ``CP437``.
 
+    ``vnc=<display>[,<optarges>]``
+        Start a VNC server on display <arg>
+
+    ``egl-headless[,rendernode<file>]``
+        Offload all OpenGL operations to a local DRI device. For any
+        graphical display, this display needs to be paired with either
+        VNC or SPICE displays.
+
     ``none``
         Do not display video output. The guest will still see an
         emulated graphics card, but its output will not be displayed to
@@ -1842,24 +1861,8 @@ SRST
         also changes the destination of the serial and parallel port
         data.
 
-    ``gtk``
-        Display video output in a GTK window. This interface provides
-        drop-down menus and other UI elements to configure and control
-        the VM during runtime.
-
-    ``vnc``
-        Start a VNC server on display <arg>
-
-    ``egl-headless``
-        Offload all OpenGL operations to a local DRI device. For any
-        graphical display, this display needs to be paired with either
-        VNC or SPICE displays.
 
-    ``spice-app``
-        Start QEMU as a Spice server and launch the default Spice client
-        application. The Spice server will redirect the serial consoles
-        and QEMU monitors. (Since 4.0)
-ERST
+    ERST
 
 DEF("nographic", 0, QEMU_OPTION_nographic,
     "-nographic      disable graphical output and redirect serial I/Os to console\n",
@@ -3799,10 +3802,10 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``mode=control`` configures 
+    Setup monitor on chardev name. ``mode=control`` configures
     a QMP monitor (a JSON RPC-style protocol) and it is not the
     same as HMP, the human monitor that has a "(qemu)" prompt.
-    ``pretty`` is only valid when ``mode=control``, 
+    ``pretty`` is only valid when ``mode=control``,
     turning on JSON pretty printing to ease
     human reading and debugging.
 ERST
@@ -3863,7 +3866,7 @@ DEF("overcommit", HAS_ARG, QEMU_OPTION_overcommit,
     QEMU_ARCH_ALL)
 SRST
 ``-overcommit mem-lock=on|off``
-  \ 
+  \
 ``-overcommit cpu-pm=on|off``
     Run qemu with hints about host resource overcommit. The default is
     to assume that host overcommits all resources.
@@ -4249,7 +4252,7 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     QEMU_ARCH_ALL)
 SRST
 ``-incoming tcp:[host]:port[,to=maxport][,ipv4=on|off][,ipv6=on|off]``
-  \ 
+  \
 ``-incoming rdma:host:port[,ipv4=on|off][,ipv6=on|off]``
     Prepare for incoming migration, listen on a given tcp port.
 
@@ -4998,7 +5001,7 @@ SRST
                [...]
 
     ``-object secret,id=id,data=string,format=raw|base64[,keyid=secretid,iv=string]``
-      \ 
+      \
     ``-object secret,id=id,file=filename,format=raw|base64[,keyid=secretid,iv=string]``
         Defines a secret to store a password, encryption key, or some
         other sensitive data. The sensitive data can either be passed
-- 
2.25.1


