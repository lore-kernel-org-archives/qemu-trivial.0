Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEjbs-0000Ug-Vy
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 15:41:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZEjbq-0000PT-5Y
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:41:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZEjbp-0006xc-Cu
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:41:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZEjbh-0006w7-TV; Mon, 13 Jul 2015 15:41:41 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 400E82B784C;
	Mon, 13 Jul 2015 19:41:41 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6DJfeNM008235; Mon, 13 Jul 2015 15:41:40 -0400
Message-ID: <55A41474.8000004@redhat.com>
Date: Mon, 13 Jul 2015 15:41:40 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1436815589-19194-1-git-send-email-jsnow@redhat.com>
	<CAFEAcA_hE0eepawDhF2DBidhd6iXvOx2f6w11+gFk-nh3Ju1XQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_hE0eepawDhF2DBidhd6iXvOx2f6w11+gFk-nh3Ju1XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Qemu-block <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: coverity touchups
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
X-List-Received-Date: Mon, 13 Jul 2015 19:41:51 -0000



On 07/13/2015 03:40 PM, Peter Maydell wrote:
> On 13 July 2015 at 20:26, John Snow <jsnow@redhat.com> wrote:
>> Just a handful of casts to quiet coverity up.
>>
>> s->ports should never exceed 32, but coverity doesn't know that.
>> ncq_tfs->sector_count should also never exceed 64K.
> 
> Personally I tend to mark that kind of thing as a false
> positive in the coverity UI and move on...
> 
> -- PMM
> 

Either way; Paolo pinged me about the NCQ one so I figured I'd just do it.

*shrug*

