Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdLfm-0004R2-2Q
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 12:39:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YdLfj-0004PJ-9W
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 12:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YdLfd-00008N-Du
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 12:39:19 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:35807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YdLfd-000087-8P
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 12:39:13 -0400
Received: by widdi4 with SMTP id di4so51457200wid.0
	for <qemu-trivial@nongnu.org>; Wed, 01 Apr 2015 09:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MZ8s8ShBRUvFJpPqGST1Cb7K6i9/0cOP0ql3zNwBGE4=;
	b=kqMhQosSFdKqD+b9gYBLSHPlrPxj40gz7apGWnwaUxWEsi3zfTnRMc20sunjN/3C0X
	JbNCU0Hajm1iiNJwYXTcrDuO5sl9zbUibT4Zn3+azL5zIAfZKcqUSxfuBhPMmemh7MwW
	FjAIa8w2/14EIQOMNjBFPFl+XI3UC9o2dmEjY+xRMnaPF/r/XbyhfpiaSI3Lx/uXfmWs
	riCyuga9KW+tNtDwyqYTH4qqzCYafj9RR2DS4wG8iOfNI/UdGrd7S7vf7oR+syUVQ9h/
	jT9rgwS2hd4tx3iEEKgG1apYHiQRSPl3Y3Ic2iVt3PCtVnOEtMkqDAzswLMni7NJ/juN
	pvGA==
X-Gm-Message-State: ALoCoQnLy35BaMLB9VW+HqN0KMV19VyFYe/W1Qimio3hamn+61jcH5uzeLszBSXsUE4q7HQ5Gzhm
X-Received: by 10.180.75.233 with SMTP id f9mr16537933wiw.5.1427906352659;
	Wed, 01 Apr 2015 09:39:12 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id xy2sm3424115wjc.14.2015.04.01.09.39.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 09:39:11 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Apr 2015 19:38:57 +0300
Message-Id: <1427906337-20805-2-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1427906337-20805-1-git-send-email-jhindin@daynix.com>
References: <1427906337-20805-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.169
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH v2] qga: fitering out -fstack-protector-strong
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
X-List-Received-Date: Wed, 01 Apr 2015 16:39:20 -0000

configure script may add -fstack-protector-strong option instead
of -fstack-protector-all, depending on availability ( see
commit 63678e17c ). Both options have to by filtered out for
qga-vss.dll, otherwise MinGW cross-compilation fails at linking
stage.

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 qga/vss-win32/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/Makefile.objs b/qga/vss-win32/Makefile.objs
index 6a69d50..7c96c6b 100644
--- a/qga/vss-win32/Makefile.objs
+++ b/qga/vss-win32/Makefile.objs
@@ -3,7 +3,7 @@
 qga-vss-dll-obj-y += requester.o provider.o install.o
 
 obj-qga-vss-dll-obj-y = $(addprefix $(obj)/, $(qga-vss-dll-obj-y))
-$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
+$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all -fstack-protector-strong, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
 
 $(obj)/qga-vss.dll: LDFLAGS = -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
 $(obj)/qga-vss.dll: $(obj-qga-vss-dll-obj-y) $(SRC_PATH)/$(obj)/qga-vss.def
-- 
2.1.0


