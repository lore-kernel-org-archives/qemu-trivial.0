Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQabl-0007V7-Mr
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 13:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jQabf-0007Nq-NR
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:20 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jQabd-0004qc-FX
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59756
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jQabc-0004mO-Uk
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 13:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587405195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KzgD9Ym5NSVjFf97eN0txk+Ac2jVc+WQkP8DXaLEsyM=;
 b=eIEYCRCeRY4aLwZ9DGNFLmcKNUbW2xlBgWOOqkBOYYVOxK/QnlfNecsITw9TOobD3VOnV3
 towyXZGxbLB71I2DlZbsYWv6rpUgNynPP4zrQilkLLecEDhx1Cs7joOv6nIWn0ejHhv4Mt
 qOqYuBiqMg6EhovxP0o7stqXE5Cjg2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-n3PrMgIWNCKysEQTbyC-Ew-1; Mon, 20 Apr 2020 13:53:11 -0400
X-MC-Unique: n3PrMgIWNCKysEQTbyC-Ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 476178017F3;
 Mon, 20 Apr 2020 17:53:10 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C851A103F;
 Mon, 20 Apr 2020 17:53:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 0/2] fix fcntl(F_SETFD) usage
Date: Mon, 20 Apr 2020 12:53:06 -0500
Message-Id: <20200420175309.75894-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 04:32:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Mon, 20 Apr 2020 17:53:20 -0000

As recently pointed out:
https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03133.html
code that blindly calls fcntl(fd, F_SETFD, 1) rather than performing a
read-modify-write when it intends to add FD_CLOEXEC is broken, in that
it can inadvertently clear other bits.

Thankfully, the culprits fixed in this series are unlikely to be
clearing either FD_CLOFORK (if Linux ever follows Solaris' lead in
adding that), or the new FD_32BIT_MODE being proposed (as the fds in
question are unlikely to have that set) - but it is still better to
write proper code than to set up a bad example prone to copy-and-paste
propagation.  And as these usages are not new to 5.0, I don't see any
reason against waiting until 5.1 to apply them.

Eric Blake (2):
  hax: Fix setting of FD_CLOEXEC
  tools: Fix use of fcntl(F_SETFD) during socket activation

 target/i386/hax-posix.c | 6 +++---
 util/systemd.c          | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

--=20
2.26.1


