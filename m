Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGpXa-00016V-Sx
	for mharc-qemu-trivial@gnu.org; Tue, 24 Mar 2020 15:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGpXY-00015j-Cz
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 15:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGpXX-0004Pm-BF
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 15:48:44 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:36218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGpXX-0004Pd-7z
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 15:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585079322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fQpQWlGEevylLVzzOus2xrHbH7b95lvZ5rhLQuOzdWA=;
 b=JIhij82oClzv49KyCETFCSZBqJdkI6Q5/urkkFMY6InUHZjgi9XsYSHOyZjgDIycdwqbi4
 3dQ7iFDlagEcyHEK8IH8n78kry0tnCpfkJ3iQz1zRujNjV56bIPuJSor/uRwSrF053cIqv
 X+J4MWTdSAhyYk4QiurLDQrffd0vnEw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-g0QSPY5eNyac39PxhL8TiQ-1; Tue, 24 Mar 2020 15:48:41 -0400
X-MC-Unique: g0QSPY5eNyac39PxhL8TiQ-1
Received: by mail-wr1-f71.google.com with SMTP id e10so6973304wrm.2
 for <qemu-trivial@nongnu.org>; Tue, 24 Mar 2020 12:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUCsr8+QDfcKRBXcL3ItOGncj3i21qbJvqFsGhi9mwo=;
 b=tbOagHtAoT8oO1HE+viEbz6X/QVZem0prg9Unsk54UzQcEQCb2NzZF1b+S1Ml774Tf
 nxQ8ckw+1pQcRm6F5V9E+rox4ahbkb0fQBmWQ3o0SuMJeV0h5l7EnriyDtDbJ64bjjJ2
 18W7o6fiTs1AuHOZz3txM/NK/zUwrdHA/2rFMblYteBfCbIjACs+WoEnTn08Am1kwvTH
 mPXn9OxloTLT9RFwsU46486XdMFo48PqUuB2gtqHW67YrBNeRbb3goliPkHqLiPAY012
 7+XSZcD9n6P6L7D9PNf6m9upUna2Wxi0Jb5+nzsFPbrEmll3U6QQk/H1A3LJr0VEdlsc
 VSWg==
X-Gm-Message-State: ANhLgQ0dH/QvFASRJQDCY0f4DBlVu1NPnGEXKk07Hq+yZu+A/+xMKa6A
 R83feS4fgjvEeLOhQJoMtoOwofBajNMm4k90UeKPiIaZ+y7FHiw1/SxqnA3to+wy9nO4sf1DE5K
 Xywo3DCe+JhOKgUVpGg==
X-Received: by 2002:adf:f544:: with SMTP id j4mr37050312wrp.183.1585079319861; 
 Tue, 24 Mar 2020 12:48:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsZtk/7FxKipYvMh4Rs8YWEI2e7o6IucE6NnNl3FURQUAR2IkDVtxN+uEPJOQm3yr64/t/l0w==
X-Received: by 2002:adf:f544:: with SMTP id j4mr37050288wrp.183.1585079319518; 
 Tue, 24 Mar 2020 12:48:39 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id h5sm4998811wro.83.2020.03.24.12.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 12:48:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sameeh Jubran <sjubran@redhat.com>, Basil Salman <basil@daynix.com>,
 qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-stable@nongnu.org, Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
Subject: [PATCH-for-5.0] qga-posix: Avoid crashing process when failing to
 allocate memory
Date: Tue, 24 Mar 2020 20:48:36 +0100
Message-Id: <20200324194836.21539-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Tue, 24 Mar 2020 19:48:45 -0000

Similarly to commit 807e2b6fce0 for Windows, kindly return a
QMP error message instead of crashing the whole process.

Cc: qemu-stable@nongnu.org
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1594054
Reported-by: Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qga/commands-posix.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 93474ff770..8f127788e6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -493,7 +493,13 @@ struct GuestFileRead *qmp_guest_file_read(int64_t hand=
le, bool has_count,
         gfh->state =3D RW_STATE_NEW;
     }
=20
-    buf =3D g_malloc0(count+1);
+    buf =3D g_try_malloc0(count + 1);
+    if (!buf) {
+        error_setg(errp,
+                   "failed to allocate sufficient memory "
+                   "to complete the requested service");
+        return NULL;
+    }
     read_count =3D fread(buf, 1, count, fh);
     if (ferror(fh)) {
         error_setg_errno(errp, errno, "failed to read file");
--=20
2.21.1


