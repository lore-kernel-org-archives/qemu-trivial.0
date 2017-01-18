Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTkzN-0006d2-BO
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 02:49:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTkzL-0006bW-3B
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 02:48:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cTkzK-00031P-BN
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 02:48:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cTkzG-0002yx-4E; Wed, 18 Jan 2017 02:48:54 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F191D90E5C;
	Wed, 18 Jan 2017 07:48:53 +0000 (UTC)
Received: from [10.36.116.60] (ovpn-116-60.ams2.redhat.com [10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0C5D8C680;
	Wed, 18 Jan 2017 07:48:51 +0000 (UTC)
To: Yang Ziyue <skiver.cloud.yzy@gmail.com>
References: <1484709699-3455-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<66ed2121-c207-d2f4-2e05-b6474bfa6a49@redhat.com>
	<CAHkcwacJ_BBOTDBxrDejqNiuzWcfrjVRWM-yNeuRF98tEc+xPw@mail.gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Ziyue Yang <yzylivezh@hotmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c8fbc6e3-7862-ad33-1344-b21b8118e0fc@redhat.com>
Date: Wed, 18 Jan 2017 08:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAHkcwacJ_BBOTDBxrDejqNiuzWcfrjVRWM-yNeuRF98tEc+xPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 18 Jan 2017 07:48:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 1/2] gdbstub.c: fix GDB connection
 segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 07:49:00 -0000

 Hi,

On 18.01.2017 08:43, Yang Ziyue wrote:
> Hi Thomas,
> 
> I'm not quite sure about that, but did you mean that I should mention
> the second patch before the Sign-off line instead of in the commit
> message?

No, I meant: You still got the sentence "Also some updates from
fprintf(stderr, ...) to error_report." in the description of your first
patch. But indeed this is now done in the second patch instead. So
simply remove that sentence from the description of your first patch,
and everything is fine :-)

 Thomas


