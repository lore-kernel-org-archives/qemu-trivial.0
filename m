Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxx7-00046M-Bs
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx3-00041f-3J
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx2-00035n-CK
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:41 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwz-00031U-By; Fri, 28 Jul 2017 01:36:37 -0400
Received: by mail-qt0-x243.google.com with SMTP id t37so8844022qtg.2;
	Thu, 27 Jul 2017 22:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C/l1dxfIleXiz59Lb8ECxSUODJcOvxahhoAHHBrWWQs=;
	b=sqjh+e+RyFN73pYASEgtHr1V+t+tKmHjmgjPW8wAwAMk/ppixiGzTtTDVue/SOG7E9
	tvWkJ34QOHs6JNA2Hxe1q52Tr5pqKkce89B+c1f2eqiwOeOsi4dmg8jezsgTCKUXCWr3
	KrjDuLMV4ARVS3/9kVdOm4JfZFZgAEtGYrezs0S7+FIHuJFu4ciqCY9pqqPup3i7gAbn
	swDvJT9NeKJWGP+4NLhdgn4nSBMuC6r0WPy5XzpLDKXD03mArTQkR6/BvaVu0MxVirew
	odOzZQ98Omcr2SGI45Np3Iv2Z2jxluUpztZeSTgjGJOizxCDrAa+zOzFCtmF1rr3yk2d
	inFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=C/l1dxfIleXiz59Lb8ECxSUODJcOvxahhoAHHBrWWQs=;
	b=DpfAC7oAbGvJCqTCnN+kB/qTJb3lkZ0mTug+MEuMfQbydZDgUpDUS6+URIw0C0Xlo0
	Zu3xJHDqbKv6DwEr819uIO8CzUhUKB6wvGAZbuUNEKiU4MsGGVSNhx3xd++5bBQhglxQ
	RUpg3XywMga1+A6k3fpsjsfAuFf47IcG/IrUJkgx8WjyZg2GH71C/y/YXZOeHetAV6wp
	YAcNT+/OdPYRK4/ik9mnbg6YRkHrEPZRD5lcXCmQElhHUxbFck44sZ6J9/lRWCfJWkSh
	MTfrhmzmMbITCOf1lgTIgI++3l/N2nYkmzhZWuxa1vbrrgFVAH7qvoqOpGOPQ1IVp5v3
	vEZw==
X-Gm-Message-State: AIVw110JrRbStbWWy7biuwhH5AiowLNv3CsTcY2+Ll4RbGxR2Yk2CamT
	b1lQDE2nMMQIig==
X-Received: by 10.200.54.200 with SMTP id b8mr8687640qtc.307.1501220196883;
	Thu, 27 Jul 2017 22:36:36 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:29 -0300
Message-Id: <20170728053610.15770-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 06/47] MAINTAINERS: add missing entry for
 vhost
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:44 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ece02522be..ddf6f3f6d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1035,6 +1035,7 @@ vhost
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: hw/*/*vhost*
+F: docs/interop/vhost-user.txt
 
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.13.3


