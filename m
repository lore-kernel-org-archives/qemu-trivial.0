Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIiSB-0004Kp-Ah
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 16:20:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bIiS9-0004Ar-0U
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bIiS6-0008Cx-Pt
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:20:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1bIiS0-0008Bs-Ti; Thu, 30 Jun 2016 16:20:41 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D8C83710E1;
	Thu, 30 Jun 2016 20:20:40 +0000 (UTC)
Received: from scv.usersys.redhat.com (unused [10.10.51.239] (may be forged))
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5UKKdup023534; Thu, 30 Jun 2016 16:20:39 -0400
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
	<209727639.3312728.1467317746061.JavaMail.zimbra@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kraxel@redhat.com,
	peter maydell <peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5b24e821-7b08-257b-0b3e-0e3336ee644c@redhat.com>
Date: Thu, 30 Jun 2016 16:20:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <209727639.3312728.1467317746061.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 30 Jun 2016 20:20:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Thu, 30 Jun 2016 20:20:50 -0000



On 06/30/2016 04:15 PM, Paolo Bonzini wrote:
> 
> 
> ----- Original Message -----
>> From: "John Snow" <jsnow@redhat.com>
>> To: qemu-devel@nongnu.org
>> Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com, "peter maydell" <peter.maydell@linaro.org>,
>> "John Snow" <jsnow@redhat.com>
>> Sent: Thursday, June 30, 2016 9:36:36 PM
>> Subject: [PATCH] Remove left shifts of negative signed integers
>>
>> Another exercise in placating Clang's increasingly strict -Werror mode.
>> Technically, this is undefined behavior. In practice, -N<<M is the same
>> as -(N<<M).
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> There's been discussions on this in the past; sorry but this is a
> super-duper NACK.
> 
> GCC correctly puts this warning under -Wextra, and promises not to ever
> make use of this facet of undefined behavior.  The only correct patch
> is the one that disables the warning for clang, and possibly adds
> -fwrapv.  In GCC, -fwrapv correctly silences ubsan's left-shift
> and signed-overflow warnings.  In Clang, this is reported at
> https://llvm.org/bugs/show_bug.cgi?id=25552.  It's a heavy hammer
> but it's the safest options as compiler evolve.
> 
> Paolo
> 

Where /exactly/ do you propose we canonicalize the clang invocation you
would like to support?

--js

