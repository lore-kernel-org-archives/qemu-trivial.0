Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bYKHi-00014t-LJ
	for mharc-qemu-trivial@gnu.org; Fri, 12 Aug 2016 17:46:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdlord2@illinois.edu>) id 1bYIAe-00038T-3q
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 15:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cdlord2@illinois.edu>) id 1bYIAY-0005GO-E6
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 15:31:07 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdlord2@illinois.edu>) id 1bYIAY-0005G8-9A
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2016 15:31:02 -0400
Received: by mail-qt0-x242.google.com with SMTP id j37so1310061qta.0
	for <qemu-trivial@nongnu.org>; Fri, 12 Aug 2016 12:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=illinois-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4/6KTs+1WvcfrXOePNDH7q4Ib4KiqWeIUIJ7BGLbrkk=;
	b=oi8pqLPCbPrc2f0AR+70PodJ6RllhO2qLAOpOqYveOYk4X/dxZ+GwfsocsognH1tGm
	rksEXRIUhuA4PkuYS9IlyIBB/XZcA/qMX9Q/kz++IGkF4du5k0NHO3qFyhlBh+f8uIch
	AfXnnP45a5nr5KVxz9QwugMgyAE8ahfrEyjoT/9I0PWAs+zZshGXx/tSePCb3TF+LpF8
	C+WtJsLIRqJWRxR7J+U0o0iZCHvQNfULt0ylkMLsQ9C71qDS/6+3qs20L6s6uOEP4IPf
	mULYYW8hpBBUURekaRn+X7wF+5vLH83e6lbaQ9qg0hMRb5/gqV5WOt2dfI4B/0fbgUXP
	URAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4/6KTs+1WvcfrXOePNDH7q4Ib4KiqWeIUIJ7BGLbrkk=;
	b=AW5lKa4C2pmEOJ8LLHkTc0TMREezUsb7jL/TT+wwRJTFBBJBOVEsLBZlK2Q4lH9xlA
	26o7thu4vOex6kGGkwynuDfNPIz+m32Il5/EbzEWhpvKuLGcGvLFb4R9XAf2l0d1EK+u
	uG2LTOlWBG06y53waaBgh5pvN4KWgAYyb6CjtuL8p/mn5umtoACaJn1Tj1mH0JLRGjk2
	kHHEIdxNLnyOSq/OtO94FgjMs5CTBPiKaIMnYS5UV4k5KGRT2lQM74yaaSB59hfyRdSD
	8hPYJPBIoHWn6sLOHIYEr8nAko+1/0vgtkdK07+9ROOkv/Dwu+fNmz6Su0KBHLmkMFHS
	nFqQ==
X-Gm-Message-State: AEkooutEfZ796ZMO/7qiIBPFshsGiHRxKLjLGZX6UlRi418xOEDfKA+NdcQf3RoUroInqbma
X-Received: by 10.200.34.53 with SMTP id o50mr19409215qto.130.1471030260633;
	Fri, 12 Aug 2016 12:31:00 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-bos-u.redhat.com.
	[66.187.233.207])
	by smtp.gmail.com with ESMTPSA id 55sm5211206qtm.36.2016.08.12.12.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 12:31:00 -0700 (PDT)
From: Colin Lord <cdlord2@illinois.edu>
To: qemu-devel@nongnu.org
Cc: Colin Lord <cdlord2@illinois.edu>, qemu-trivial@nongnu.org,
	pbonzini@redhat.com, armbru@redhat.com
Date: Fri, 12 Aug 2016 15:30:48 -0400
Message-Id: <1471030248-21637-1-git-send-email-cdlord2@illinois.edu>
X-Mailer: git-send-email 2.5.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
X-Mailman-Approved-At: Fri, 12 Aug 2016 17:46:33 -0400
Subject: [Qemu-trivial] [PATCH v3] help: Update help to remove misleading
 display information
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2016 19:31:09 -0000

Updates the help messages to remove misleading information about SDL
being the normal display used.

Signed-off-by: Colin Lord <cdlord2@illinois.edu>
---
v3: Try to make help more general to cover all cases nicely.
 qemu-options.hx | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index a71aaf8..c093a59 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -982,13 +982,14 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
 STEXI
 @item -nographic
 @findex -nographic
-Normally, QEMU uses SDL to display the VGA output. With this option,
-you can totally disable graphical output so that QEMU is a simple
-command line application. The emulated serial port is redirected on
-the console and muxed with the monitor (unless redirected elsewhere
-explicitly). Therefore, you can still use QEMU to debug a Linux kernel
-with a serial console.  Use @key{C-a h} for help on switching between
-the console and monitor.
+Normally, if QEMU is compiled with graphical window support, it displays
+output such as guest graphics, guest console, and the QEMU monitor in a
+window. With this option, you can totally disable graphical output so
+that QEMU is a simple command line application. The emulated serial port
+is redirected on the console and muxed with the monitor (unless
+redirected elsewhere explicitly). Therefore, you can still use QEMU to
+debug a Linux kernel with a serial console. Use @key{C-a h} for help on
+switching between the console and monitor.
 ETEXI
 
 DEF("curses", 0, QEMU_OPTION_curses,
@@ -997,9 +998,11 @@ DEF("curses", 0, QEMU_OPTION_curses,
 STEXI
 @item -curses
 @findex -curses
-Normally, QEMU uses SDL to display the VGA output.  With this option,
-QEMU can display the VGA output when in text mode using a
-curses/ncurses interface.  Nothing is displayed in graphical mode.
+Normally, if QEMU is compiled with graphical window support, it displays
+output such as guest graphics, guest console, and the QEMU monitor in a
+window. With this option, QEMU can display the VGA output when in text
+mode using a curses/ncurses interface. Nothing is displayed in graphical
+mode.
 ETEXI
 
 DEF("no-frame", 0, QEMU_OPTION_no_frame,
@@ -1243,13 +1246,14 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
 STEXI
 @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
 @findex -vnc
-Normally, QEMU uses SDL to display the VGA output.  With this option,
-you can have QEMU listen on VNC display @var{display} and redirect the VGA
-display over the VNC session.  It is very useful to enable the usb
-tablet device when using this option (option @option{-usbdevice
-tablet}). When using the VNC display, you must use the @option{-k}
-parameter to set the keyboard layout if you are not using en-us. Valid
-syntax for the @var{display} is
+Normally, if QEMU is compiled with graphical window support, it displays
+output such as guest graphics, guest console, and the QEMU monitor in a
+window. With this option, you can have QEMU listen on VNC display
+@var{display} and redirect the VGA display over the VNC session. It is
+very useful to enable the usb tablet device when using this option
+(option @option{-usbdevice tablet}). When using the VNC display, you
+must use the @option{-k} parameter to set the keyboard layout if you are
+not using en-us. Valid syntax for the @var{display} is
 
 @table @option
 
-- 
2.5.5


