Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j01Pr-0005X7-I1
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 06:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j01Pl-0005SD-1S
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j01Pk-00085D-4V
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:03:12 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29589
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j01Pk-00084a-15
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581073391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mqWybM8Iuen1mTi2efA/ZOh6zXpQGOQ/ZBqfKEIS7iI=;
 b=YZ+T52wvc4CQRH5xWRD9p4+tACHlt3ueDTplfbjCTnKGLPsx2xB/Zw+ezMO9djM+hz4oBm
 ift01f8OUq5F7FFa5zOq7u8BhQ0c72or3ezSrvr4nfNz7EIB6GBswQy82TTUJGHoSFKXS7
 VgWj4HtAhj3vsoO4GAZX5i+9PWfcmJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-IAeEhJVINTiP0roittwfrg-1; Fri, 07 Feb 2020 06:03:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258F21800D42;
 Fri,  7 Feb 2020 11:03:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF1E1001B09;
 Fri,  7 Feb 2020 11:03:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] vl: Abort if multiple machines are registered as default
Date: Fri,  7 Feb 2020 12:02:59 +0100
Message-Id: <20200207110259.12544-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: IAeEhJVINTiP0roittwfrg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 07 Feb 2020 11:03:17 -0000

It would be confusing to have multiple default machines.
Abort if this ever occurs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/vl.c b/vl.c
index 7dcb0879c4..da828188eb 100644
--- a/vl.c
+++ b/vl.c
@@ -2354,6 +2354,8 @@ static MachineClass *machine_parse(const char *name, =
GSList *machines)
     GSList *el;
=20
     if (is_help_option(name)) {
+        int default_count =3D 0;
+
         printf("Supported machines are:\n");
         machines =3D g_slist_sort(machines, machine_class_cmp);
         for (el =3D machines; el; el =3D el->next) {
@@ -2364,6 +2366,11 @@ static MachineClass *machine_parse(const char *name,=
 GSList *machines)
             printf("%-20s %s%s%s\n", mc->name, mc->desc,
                    mc->is_default ? " (default)" : "",
                    mc->deprecation_reason ? " (deprecated)" : "");
+            default_count +=3D !!mc->is_default;
+        }
+        if (default_count > 1) {
+            error_printf("Multiple default machines available\n");
+            abort();
         }
         exit(0);
     }
--=20
2.21.1


