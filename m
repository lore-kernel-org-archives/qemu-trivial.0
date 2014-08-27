Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMWGI-0001ry-6t
	for mharc-qemu-trivial@gnu.org; Wed, 27 Aug 2014 01:59:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XMWGA-0001qT-8b
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 01:59:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XMWG4-0007cI-0k
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 01:59:06 -0400
Received: from mail-we0-f169.google.com ([74.125.82.169]:48254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XMWG3-0007c6-RM
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 01:58:59 -0400
Received: by mail-we0-f169.google.com with SMTP id u56so15596896wes.28
	for <qemu-trivial@nongnu.org>; Tue, 26 Aug 2014 22:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iFUrJ1NiJ9qL3APOO48Ofw750KTPdcHTSxBOCh+7yoE=;
	b=ivPbZrNQEr8caTp/m9fU122DgjbCmwnuEany1vuQo0tqeErLDTl8FNQFAPtaJnNQ12
	aHq2Dsq/MkbT1og8R+ZYcQ1eNCZHjbR5flRkyJBtgOKhHFqzeHzWYswCYEUCcKXs+mPk
	RcdTOaRKLH0T4pDZBsU6s4pOBvXX+KBcTSWD/QitLxTJvDKyvVaIys8F+78hyeIgHXes
	UFRri87mS+Fczt1iu5LZvjjzsnymzAJqW5GvcYs/maz5BFf2PYGjI/8cgzo3aGFAPyHa
	zNLdqRTH6TT/MsHEs6BCCYDSQGtJddPEUBdgIZoxpJOrDX24Ym/A5x4toczihFDexfpW
	g1PQ==
X-Gm-Message-State: ALoCoQnDaAvFiyEd34zBwUwJZD3Gb4VDUEm6GZlnXTG3x2SbLN86oZArrO9vo5OeGoygdCQmo8cz
X-Received: by 10.180.73.6 with SMTP id h6mr25698242wiv.65.1409119138768;
	Tue, 26 Aug 2014 22:58:58 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id y5sm14117735wje.32.2014.08.26.22.58.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Aug 2014 22:58:57 -0700 (PDT)
From: Dmitry Fleytman <dmitry@daynix.com>
To: qemu-devel@nongnu.org
Date: Wed, 27 Aug 2014 08:58:43 +0300
Message-Id: <1409119123-15445-1-git-send-email-dmitry@daynix.com>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.169
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
	Anthony Liguori <anthony@codemonkey.ws>, Yan Vugenfirer <yan@daynix.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add VMWare devices maintainer
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Aug 2014 05:59:12 -0000

Signed-off-by: Dmitry Fleytman <dmitry@daynix.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59940f9..1b3e2be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -678,6 +678,12 @@ S: Maintained
 F: hw/*/xilinx_*
 F: include/hw/xilinx.h
 
+Vmware
+M: Dmitry Fleytman <dmitry@daynix.com>
+S: Maintained
+F: hw/net/vmxnet*
+F: hw/scsi/vmw_pvscsi*
+
 Subsystems
 ----------
 Audio
-- 
1.9.3


