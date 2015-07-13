Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEcff-0007OR-Ub
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 08:17:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZEcfc-0007LD-DR
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 08:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZEcfb-0003d2-LL
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 08:17:16 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:34587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZEcfW-0003bE-V0; Mon, 13 Jul 2015 08:17:11 -0400
Received: by wibud3 with SMTP id ud3so28045198wib.1;
	Mon, 13 Jul 2015 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=bKdgD8HybcXmIPPIQnPqQsoS6TGcrhgV1SjYZTwv+6g=;
	b=Y5X5Z7DVVo1uyISWugLm2Alvwf2Gi8zcehxecYlhIsme4mVzsgQMVXHyn+7wNonPrz
	HF+KyjCKVioYg+9T8dN3PzhDUMiletTr80SF1wWqrOlJCgJ+qxO3jUh68OXLl7Hqt0ZJ
	D2kZfgvYTRtT4HZRk5Q8dmIIlTXhLn/uGqPRP5ucin8plgIfMRqE/dERXuwZOIc3JR1C
	oFlYLmr7/a7lwWVoAlBX2dm/7kyXymZmBkHejUoYeEJTv6P2ldPoGIr+HfDsZxWp1TKV
	vOVy8FxRk9L6zsSbADGlqXRlvFQ2u7Og8VrufrmU7XScWEWPF5SQgNBatj91Cm9ldvEi
	RuXg==
X-Received: by 10.180.85.134 with SMTP id h6mr17272924wiz.66.1436789830293;
	Mon, 13 Jul 2015 05:17:10 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-156-123.clienti.tiscali.it.
	[94.39.156.123]) by smtp.googlemail.com with ESMTPSA id
	p2sm14314143wix.11.2015.07.13.05.17.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jul 2015 05:17:09 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1436772617-2490-1-git-send-email-kraxel@redhat.com>
	<CAFEAcA9gbPB8PTimK7J=wAC8gtQtgFxLhEkGOESD1r52f9-m6w@mail.gmail.com>
	<1436788098.26533.22.camel@redhat.com>
	<1436788900.26533.25.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55A3AC44.9070705@redhat.com>
Date: Mon, 13 Jul 2015 14:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <1436788900.26533.25.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] virtio-input: enable on non-linux hosts
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
X-List-Received-Date: Mon, 13 Jul 2015 12:17:17 -0000



On 13/07/2015 14:01, Gerd Hoffmann wrote:
>> > 
>> > Did a build test on freebsd -- passed.
> Oops, the windows cross builds fails though (due to
> include/standard-headers/linux/input.h including sys/ioctl.h).
> 
> Ok, scratch that one, back to the drawing board ...

The sys/ioctl.h include doesn't seem too useful.  This patch compiles:

diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
index f7e3d84..3feecfd 100644
--- a/hw/input/virtio-input-host.c
+++ b/hw/input/virtio-input-host.c
@@ -12,6 +12,7 @@
 #include "hw/virtio/virtio-input.h"

 #include "standard-headers/linux/input.h"
+#include <sys/ioctl.h>

 /* ----------------------------------------------------------------- */

diff --git a/include/standard-headers/linux/input.h
b/include/standard-headers/linux/input.h
index a459dd2..b003c67 100644
--- a/include/standard-headers/linux/input.h
+++ b/include/standard-headers/linux/input.h
@@ -10,7 +10,6 @@


 #include <sys/time.h>
-#include <sys/ioctl.h>
 #include <sys/types.h>
 #include "standard-headers/linux/types.h"


Perhaps we can drop the include in scripts/update-linux-headers.sh?

Paolo

