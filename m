Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQabp-0007ZH-Vz
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 13:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jQabk-0007UL-5n
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:24 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jQabe-0004tT-7f
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36570
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jQabd-0004oK-NA
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587405196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3P+njxzp3Lmcfu/1uJRc/Eo2AmUeLCf+wLUBObG0sX0=;
 b=K8GKDiAhI6klzhUNU6OgJk9tQ7NF8AK2WAn6OGwAC7egk/p1HTcuNd/O4IKOkPntr6w7g5
 zTXVRS6aljqs8LgCfZ0kVKMLtzpAFc/97B0qxSzzmlyoen46YcpLs1FNvTnBkfjmtAnEuC
 tXgybS2BdnYcFqfUJ9Bzk3SYd7bgpGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-fGWRDdDzPG2fthAgax_6Kw-1; Mon, 20 Apr 2020 13:53:14 -0400
X-MC-Unique: fGWRDdDzPG2fthAgax_6Kw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8905C800D5C;
 Mon, 20 Apr 2020 17:53:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16803A103F;
 Mon, 20 Apr 2020 17:53:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Wenchao Wang <wenchao.wang@intel.com>, Colin Xu <colin.xu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 haxm-team@intel.com (open list:X86 HAXM CPUs)
Subject: [PATCH 1/2] hax: Fix setting of FD_CLOEXEC
Date: Mon, 20 Apr 2020 12:53:07 -0500
Message-Id: <20200420175309.75894-2-eblake@redhat.com>
In-Reply-To: <20200420175309.75894-1-eblake@redhat.com>
References: <20200420175309.75894-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:29:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 20 Apr 2020 17:53:25 -0000

Blindly setting FD_CLOEXEC without a read-modify-write will
inadvertently clear any other intentionally-set bits, such as a
proposed new bit for designating a fd that must behave in 32-bit mode.
Use our wrapper function instead of an incorrect hand-rolled version.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 target/i386/hax-posix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/hax-posix.c b/target/i386/hax-posix.c
index 3bad89f13337..5f9d1b803dec 100644
--- a/target/i386/hax-posix.c
+++ b/target/i386/hax-posix.c
@@ -23,7 +23,7 @@ hax_fd hax_mod_open(void)
         fprintf(stderr, "Failed to open the hax module\n");
     }

-    fcntl(fd, F_SETFD, FD_CLOEXEC);
+    qemu_set_cloexec(fd);

     return fd;
 }
@@ -147,7 +147,7 @@ hax_fd hax_host_open_vm(struct hax_state *hax, int vm_i=
d)
     fd =3D open(vm_name, O_RDWR);
     g_free(vm_name);

-    fcntl(fd, F_SETFD, FD_CLOEXEC);
+    qemu_set_cloexec(fd);

     return fd;
 }
@@ -200,7 +200,7 @@ hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
     if (fd < 0) {
         fprintf(stderr, "Failed to open the vcpu devfs\n");
     }
-    fcntl(fd, F_SETFD, FD_CLOEXEC);
+    qemu_set_cloexec(fd);
     return fd;
 }

--=20
2.26.1


