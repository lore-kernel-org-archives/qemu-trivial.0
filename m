Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2S-0002SG-VS
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2Q-0002QB-4d
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2O-00020q-W6
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:25:58 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2K-0001wg-AY; Thu, 27 Jul 2017 21:25:52 -0400
Received: by mail-qk0-x242.google.com with SMTP id v76so8318174qka.5;
	Thu, 27 Jul 2017 18:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c8N1IIvRtodZdi42fXg6PKmhcly4KpXhqjhstkAH8SU=;
	b=Hx98jyWNMfJ4DkaBqvGx11hGt/4dEwcW3DRGCsWe0nbRtoQ27ZNhuJ71zr9eZU/RZM
	+d2crIFUEeXIA4YNxJaH8omGBnCnwSZe7SPj9ij5MSsT65nJAFc45dWXZE3+Ta57KxXo
	nFW+fAlHKQO4q36eiZ+HEPjnl92NaFd7aSVqSCMNM5ftnbSOkbHbhVwKn6HD2SRknboU
	95BCCRky2cptlfBA2p++2Ox8xc/BcCQvHEtPaBjuItwFRG3SDgeopaTQpYIVrYweW69W
	oQ24YvC+WOUGsTCvo1U8JRScGi8wvOG7wbiYsMIhI0fMbODGOzTYO5lYuU0fTKOE8SyQ
	nxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=c8N1IIvRtodZdi42fXg6PKmhcly4KpXhqjhstkAH8SU=;
	b=n6aNlGpqY0jUJH+GQunNqSJ/XjxsbMKubTdIA3dtsxGds39uvMlgr8LMgCw2Zp9Z9C
	9f0X3/fb83hW2ferhLX3Bs79l9IpFB3ZDwrFymeq/G5eC50zlMgAUj/B5sAVaPB6zVy3
	fSIlDHA+g2U1Mk+oPoqW3YpaRgzmLOMeWpgGkXazHhChoJpJYmT4zS3X5bezh409TDe9
	0bJCvejXswDz9itrZzys+w4tJ9498ExhaKDtozhem+rklj6wT3QW0PlEd97mrTSkzED7
	Iit/d44QBalQiYtD5PGfPlAhIhK7yLsQCFtisdExfYgwobJxOw+eEXQvFFyH8aDuyURW
	ogUQ==
X-Gm-Message-State: AIVw110lnyRPQk7M19tW+JYjOu2Yft0+aItXRPt5IHC6bked6DOzJiGI
	UKZOhFkOFkZwE8qWd9k8Dw==
X-Received: by 10.55.46.66 with SMTP id u63mr8184235qkh.333.1501205151427;
	Thu, 27 Jul 2017 18:25:51 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.25.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:25:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Thu, 27 Jul 2017 22:25:34 -0300
Message-Id: <20170728012542.29975-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 0/8] docs: fix broken paths
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:00 -0000

Hi, following Cleber Rosa example I cleaned more invalid references.

Eric said this can wait 2.11, however these patches don't change any code
generated, I think the 2.10 users deserve an up-to-date doc :p

I used the following command (and consider include it in some CI test job):

$ git grep docs/ \
      | sed -ne "s/.* \(docs[^ :)}\"\']*\).*/\1/p" \
      | sed -e 's/\(.*\)\.$/\1/p' | sort -u | while read p;do
    ls -ld $p 1>/dev/null
  done

Regards,

Phil.

Cleber Rosa (1):
  docs: fix broken paths to docs/interop dir

Philippe Mathieu-Daudé (7):
  docs: fix broken paths to docs/interop/qcow2.txt
  docs: fix broken paths to docs/devel/qapi-code-gen.txt
  docs: fix broken paths to docs/devel/atomics.txt
  docs: fix broken paths to docs/devel/tracing.txt
  docs: fix broken paths to docs/config/ich9-ehci-uhci.cfg
  docs: fix broken paths to docs/specs/ivshmem-spec.txt
  docs: fix broken paths to docs/spin/

 audio/trace-events                  | 2 +-
 block/trace-events                  | 2 +-
 chardev/trace-events                | 2 +-
 crypto/trace-events                 | 2 +-
 docs/devel/lockcnt.txt              | 2 +-
 docs/devel/writing-qmp-commands.txt | 4 ++--
 docs/qcow2-cache.txt                | 2 +-
 docs/specs/pci-ids.txt              | 2 +-
 docs/spin/aio_notify.promela        | 6 +++---
 docs/spin/aio_notify_accept.promela | 4 ++--
 docs/spin/aio_notify_bug.promela    | 4 ++--
 docs/spin/tcg-exclusive.promela     | 2 +-
 docs/usb2.txt                       | 2 +-
 hw/9pfs/trace-events                | 2 +-
 hw/acpi/trace-events                | 2 +-
 hw/alpha/trace-events               | 2 +-
 hw/arm/trace-events                 | 2 +-
 hw/audio/trace-events               | 2 +-
 hw/block/dataplane/trace-events     | 2 +-
 hw/block/trace-events               | 2 +-
 hw/char/trace-events                | 2 +-
 hw/display/trace-events             | 2 +-
 hw/dma/trace-events                 | 2 +-
 hw/i386/trace-events                | 2 +-
 hw/input/trace-events               | 2 +-
 hw/intc/trace-events                | 2 +-
 hw/isa/trace-events                 | 2 +-
 hw/mem/trace-events                 | 2 +-
 hw/misc/trace-events                | 2 +-
 hw/net/trace-events                 | 2 +-
 hw/nvram/trace-events               | 2 +-
 hw/pci/trace-events                 | 2 +-
 hw/ppc/trace-events                 | 2 +-
 hw/s390x/trace-events               | 2 +-
 hw/scsi/trace-events                | 2 +-
 hw/sd/trace-events                  | 2 +-
 hw/sparc/trace-events               | 2 +-
 hw/timer/trace-events               | 2 +-
 hw/usb/trace-events                 | 2 +-
 hw/vfio/trace-events                | 2 +-
 hw/virtio/trace-events              | 2 +-
 hw/xen/trace-events                 | 2 +-
 include/block/aio.h                 | 2 +-
 include/qapi/visitor.h              | 2 +-
 include/qemu/atomic.h               | 4 ++--
 io/trace-events                     | 2 +-
 linux-user/trace-events             | 2 +-
 migration/trace-events              | 2 +-
 net/trace-events                    | 2 +-
 qapi-schema.json                    | 4 ++--
 qapi/introspect.json                | 2 +-
 qapi/qapi-util.c                    | 2 +-
 qom/trace-events                    | 2 +-
 scripts/qapi2texi.py                | 2 +-
 scripts/simpletrace.py              | 2 +-
 target/arm/trace-events             | 2 +-
 target/i386/trace-events            | 2 +-
 target/mips/trace-events            | 2 +-
 target/ppc/trace-events             | 2 +-
 target/s390x/trace-events           | 2 +-
 target/sparc/trace-events           | 2 +-
 tcg/README                          | 2 +-
 ui/trace-events                     | 2 +-
 util/trace-events                   | 2 +-
 64 files changed, 71 insertions(+), 71 deletions(-)

-- 
2.13.3


