Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gK3Gv-0001HN-Hd
	for mharc-qemu-trivial@gnu.org; Tue, 06 Nov 2018 10:28:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gK3Gq-0000yk-W4
	for qemu-trivial@nongnu.org; Tue, 06 Nov 2018 10:28:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gK3Gl-0005w8-Bo
	for qemu-trivial@nongnu.org; Tue, 06 Nov 2018 10:28:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gK3GV-0003JP-5k; Tue, 06 Nov 2018 10:27:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7409D307EA8D;
	Tue,  6 Nov 2018 15:26:21 +0000 (UTC)
Received: from [10.40.204.52] (ovpn-204-52.brq.redhat.com [10.40.204.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D91B110841BF;
	Tue,  6 Nov 2018 15:26:18 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, P J P <ppandit@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Arash TC <tohidi.arash@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <pmathieu@redhat.com>
References: <20181021175858.25886-1-ppandit@redhat.com>
	<nycvar.YSQ.7.76.1810270118190.7551@xnncv>
	<nycvar.YSQ.7.76.1811021434001.17929@xnncv>
	<1055bb12-6b57-1240-790c-930f2405ebee@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <da6687d1-c6cd-eb7a-263c-f11893bbbd5c@redhat.com>
Date: Tue, 6 Nov 2018 16:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1055bb12-6b57-1240-790c-930f2405ebee@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 06 Nov 2018 15:26:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] bt: use size_t type for
 length parameters instead of int
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
X-List-Received-Date: Tue, 06 Nov 2018 15:28:04 -0000

On 06/11/2018 15:52, Thomas Huth wrote:
> On 2018-11-02 10:05, P J P wrote:
>> +-- On Sat, 27 Oct 2018, P J P wrote --+
>> |+-- On Sun, 21 Oct 2018, P J P wrote --+
>> || The length parameter values are not negative, thus use an unsigned
>> || type 'size_t' for them. Many routines pass 'len' values to memcpy(3)
>> || calls. If it was negative, it could lead to memory corruption issues.
>> || Add check to avoid it.
>> || 
>> || Reported-by: Arash TC <tohidi.arash@gmail.com>
>> || Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> || ---
>> ||  bt-host.c              |  8 +++---
>> ||  bt-vhci.c              |  7 +++---
>> ||  hw/bt/core.c           |  2 +-
>> ||  hw/bt/hci-csr.c        | 20 +++++++--------
>> ||  hw/bt/hci.c            | 38 ++++++++++++++--------------
>> ||  hw/bt/hid.c            | 10 ++++----
>> ||  hw/bt/l2cap.c          | 56 ++++++++++++++++++++++--------------------
>> ||  hw/bt/sdp.c            |  6 ++---
>> ||  hw/usb/dev-bluetooth.c | 12 ++++-----
>> ||  include/hw/bt.h        |  8 +++---
>> ||  include/sysemu/bt.h    | 10 ++++----
>> ||  11 files changed, 90 insertions(+), 87 deletions(-)
>> || 
>> || Update v1: add assert check in vhci_host_send. Also check other places wherein
>> || length is used with fixed size buffers.
>> ||   -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03831.html
>> | 
>> | Ping...!
>>
>> Ping...!
> 
> The bluetooth subsystem is completely unmaintained, so if Paolo does not
> want to pick it up through his "misc" tree, maybe Peter could apply this
> patch directly? Or maybe it could go through the trivial tree since it
> does not look very complicated?
> 
> FWIW, the patch looks OK to me at a first glance, so:
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> PS: I still think we should deprecate the bt subsystem, since nobody
> really touched it within years...
> 

I can add it to the trivial-patches branch, but I don't plan any pull
request before the 3.1 release in December.

Thanks,
Laurent

