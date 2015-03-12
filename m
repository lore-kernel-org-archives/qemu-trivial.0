Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW5vr-00035T-CR
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 12:25:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YW0T1-0005Xm-Bs
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YW0Sr-0000vm-Rx
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:35:51 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:45037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YW0Sr-0000ve-My
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:35:41 -0400
Received: by wghl18 with SMTP id l18so15283776wgh.11
	for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2015 03:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AwZOMzAfITrblftxCBY6NhHcrxz69GChm93723xfIsU=;
	b=cIrHqL23HYowF6cy9BkNGx1RLbO89AzTsOmDbwbSgq2DvmMmhhi8g5zd6e5jLE5DAH
	5IXhu7kNNov5LG/gqZwUowU9Wu2r7vHxAkD6/l6mf6CJbfLdlt4VuTN/SN4abM40XtS+
	C6AUDYmzS0U/xFDq+JkiHDPJ2j6HpXD9WUjlWpTfS6lNE2SfDnLR5tNR7IXWWphdvYOL
	zv4gkvhl/YVipMVpQTwCxjPiBFdc19IWAJ8qaN986jB8erncTNR+zIh2aSnC4kIQZw1A
	wRsEKD0Bq6dVxxYBw5QBUDQ1x4y1W4gGXmy4VvFJhLlXjvKeL7OfWqsSHg7eUDcgSCN6
	wLKA==
X-Gm-Message-State: ALoCoQmM2LN98tKSOY6S9MAhZGncKR/Hfthp29uLkkpYlQ46JX3Porn2eDeaSUovWBt8MyZ1RmHg
X-Received: by 10.194.62.52 with SMTP id v20mr86119507wjr.137.1426156541143;
	Thu, 12 Mar 2015 03:35:41 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63]) by mx.google.com with ESMTPSA id
	lx10sm9395596wjb.17.2015.03.12.03.35.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 03:35:40 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Mar 2015 12:35:29 +0200
Message-Id: <1426156529-31276-2-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1426156529-31276-1-git-send-email-jhindin@daynix.com>
References: <1426156529-31276-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.41
X-Mailman-Approved-At: Thu, 12 Mar 2015 12:25:58 -0400
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH] When building qga-vss.dll with 64-bit MinGW
	toolchain,
	qga-vss.dll linking fails with unresolved symbols from libssp,
	stack protection support, like the  following message:
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
X-List-Received-Date: Thu, 12 Mar 2015 10:35:55 -0000

.../qga/vss-win32/install.cpp:52: undefined reference to `__stack_chk_fail'

The patch fixes the problem by adding -fstack-protector-all option to the
linker options' list.

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 qga/vss-win32/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/Makefile.objs b/qga/vss-win32/Makefile.objs
index 6a69d50..3b296f0 100644
--- a/qga/vss-win32/Makefile.objs
+++ b/qga/vss-win32/Makefile.objs
@@ -5,7 +5,7 @@ qga-vss-dll-obj-y += requester.o provider.o install.o
 obj-qga-vss-dll-obj-y = $(addprefix $(obj)/, $(qga-vss-dll-obj-y))
 $(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
 
-$(obj)/qga-vss.dll: LDFLAGS = -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
+$(obj)/qga-vss.dll: LDFLAGS =  -fstack-protector-all -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
 $(obj)/qga-vss.dll: $(obj-qga-vss-dll-obj-y) $(SRC_PATH)/$(obj)/qga-vss.def
 	$(call quiet-command,$(CXX) -o $@ $(qga-vss-dll-obj-y) $(SRC_PATH)/qga/vss-win32/qga-vss.def $(CXXFLAGS) $(LDFLAGS),"  LINK  $(TARGET_DIR)$@")
 
-- 
2.1.0


