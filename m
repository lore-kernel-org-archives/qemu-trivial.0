Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUtqq-00020Z-29
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2019 09:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hhan@redhat.com>) id 1iUsXH-0001BO-GE
 for qemu-trivial@nongnu.org; Wed, 13 Nov 2019 08:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hhan@redhat.com>) id 1iUsXD-0001vU-Mv
 for qemu-trivial@nongnu.org; Wed, 13 Nov 2019 08:18:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20182
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhan@redhat.com>) id 1iUsXD-0001v1-HS
 for qemu-trivial@nongnu.org; Wed, 13 Nov 2019 08:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573651090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oRlArMFWyud7kUjmh/m3vluscZB87Gsshm5D6gU2PGM=;
 b=gbK2wX1tUc+VNkaZnMsDARsqrdBu91elnuH6JrYHX5EQkdGOJx6aWrkbeJGwJjbp3Q2fG8
 Ai4O3x0JqAw/+Q/uUc8mrUGNIyrZDnj3K5jZYjqdKQj6NAyEUaLAmIJZYF96mm2w0toBx5
 6o0tw0+7rDC3ioTMOGGlOelYOptQijk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-41__45EZP42qd3yNM9WwNA-1; Wed, 13 Nov 2019 08:17:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2FA8048E7
 for <qemu-trivial@nongnu.org>; Wed, 13 Nov 2019 13:17:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-128.pek2.redhat.com
 [10.72.12.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2C1C891C;
 Wed, 13 Nov 2019 13:17:00 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Han Han <hhan@redhat.com>
Subject: [PATCH] scripts: Fix undefinited name 'file' error for python3
Date: Wed, 13 Nov 2019 21:16:55 +0800
Message-Id: <20191113131655.307847-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 41__45EZP42qd3yNM9WwNA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-Mailman-Approved-At: Wed, 13 Nov 2019 09:42:31 -0500
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
X-List-Received-Date: Wed, 13 Nov 2019 13:18:16 -0000

In python3, 'file' is no longer a keyword for file type object. So it
will can error when run the scripts by python3:

$ python3 ./scripts/vmstate-static-checker.py -s 4.0.json -d 4.1.json
Traceback (most recent call last):
  File "./scripts/vmstate-static-checker.py", line 431, in <module>
    sys.exit(main())
  File "./scripts/vmstate-static-checker.py", line 378, in main
    parser.add_argument('-s', '--src', type=3Dfile, required=3DTrue,
NameError: name 'file' is not defined

Replace file type to argparse.FileType('r').

Signed-off-by: Han Han <hhan@redhat.com>
---
 scripts/vmstate-static-checker.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-che=
cker.py
index d3467288..14f199a0 100755
--- a/scripts/vmstate-static-checker.py
+++ b/scripts/vmstate-static-checker.py
@@ -375,9 +375,9 @@ def main():
     help_text =3D "Parse JSON-formatted vmstate dumps from QEMU in files S=
RC and DEST.  Checks whether migration from SRC to DEST QEMU versions would=
 break based on the VMSTATE information contained within the JSON outputs. =
 The JSON output is created from a QEMU invocation with the -dump-vmstate p=
arameter and a filename argument to it.  Other parameters to QEMU do not ma=
tter, except the -M (machine type) parameter."
=20
     parser =3D argparse.ArgumentParser(description=3Dhelp_text)
-    parser.add_argument('-s', '--src', type=3Dfile, required=3DTrue,
+    parser.add_argument('-s', '--src', type=3Dargparse.FileType('r'), requ=
ired=3DTrue,
                         help=3D'json dump from src qemu')
-    parser.add_argument('-d', '--dest', type=3Dfile, required=3DTrue,
+    parser.add_argument('-d', '--dest', type=3Dargparse.FileType('r'), req=
uired=3DTrue,
                         help=3D'json dump from dest qemu')
     parser.add_argument('--reverse', required=3DFalse, default=3DFalse,
                         action=3D'store_true',
--=20
2.23.0


