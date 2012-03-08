Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5g9k-0004hW-6H
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 11:25:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S5g9f-0004gP-1H
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 11:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S5g9d-000305-9t
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 11:25:26 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:61208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S5g9d-0002zk-3u
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 11:25:25 -0500
Received: by pbcuo5 with SMTP id uo5so1969555pbc.4
	for <qemu-trivial@nongnu.org>; Thu, 08 Mar 2012 08:25:23 -0800 (PST)
Received: by 10.68.201.73 with SMTP id jy9mr10621945pbc.35.1331223923092;
	Thu, 08 Mar 2012 08:25:23 -0800 (PST)
Received: from [192.168.0.108] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id u8sm2861009pbr.53.2012.03.08.08.25.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 08:25:21 -0800 (PST)
Message-ID: <4F58DD6F.8080907@codemonkey.ws>
Date: Thu, 08 Mar 2012 10:25:19 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1330176948-14379-1-git-send-email-sw@weilnetz.de>	<CAJSP0QXAc5S6dvh-6EJkL8RNfDCkD=7QcbT0DMZTiS5D+xTQsg@mail.gmail.com>
	<4F58D961.70706@redhat.com>
In-Reply-To: <4F58D961.70706@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-Gm-Message-State: ALoCoQlhrAC6gvhCB258dolQG1QgeGXX2TPnLN3e8AipVdR4/w5pXXIEHPXBRUpeo9Tew5BZwsc5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Fix packed boolean
	struct members
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
X-List-Received-Date: Thu, 08 Mar 2012 16:25:31 -0000

On 03/08/2012 10:08 AM, Paolo Bonzini wrote:
> Il 08/03/2012 16:26, Stefan Hajnoczi ha scritto:
>> I had to drop this patch from the trivial patches tree, it tickles a
>> new gcc warning.  Please resend with the necessary change.
>>
>> I cannot reproduce it on my build host here with gcc Debian 4.6.2-12
>> but Anthony reports the following Ubuntu/Linaro 4.5.2-8ubuntu4:
>>
>>    CC    ui/vnc-auth-sasl.o
>> cc1: warnings being treated as errors
>> /home/anthony/git/qemu/ui/vnc-auth-sasl.c: In function
>> ‘vnc_sasl_client_cleanup’:
>> /home/anthony/git/qemu/ui/vnc-auth-sasl.c:34:9: error: suggest
>> parentheses around assignment used as truth value
>> make: *** [ui/vnc-auth-sasl.o] Error 1
>
> Looks like a GCC bug where
>
>     x = y = 0;
>
> is converted to
>
>     x = (y = 0) != 0;

Curious, why convert like this?  What does this optimization do?

Regards,

Anthony Liguori

>
> and the magic that does this inside the compiler causes the warning.
>
> We should add a configure check to only add -Werror on compilers newer
> than X (for example X could leave out GCC 4.5), so that this patch can
> be reapplied.
>
> Paolo
>


