Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wzsad-0005s5-Vc
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 15:10:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WzsaW-0005pN-0X
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 15:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WzsaP-0001P2-9C
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 15:10:31 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:37828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WzsaB-0001LR-B7; Wed, 25 Jun 2014 15:10:11 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D0D321180F74; Wed, 25 Jun 2014 21:10:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id GjbDvhmJykrn; Wed, 25 Jun 2014 21:10:08 +0200 (CEST)
Received: from [192.168.178.35] (p54AC9DF9.dip0.t-ipconnect.de
	[84.172.157.249])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3B84A11805CF; Wed, 25 Jun 2014 21:10:06 +0200 (CEST)
Message-ID: <53AB1E8E.2030404@weilnetz.de>
Date: Wed, 25 Jun 2014 21:10:06 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1403683241-20678-1-git-send-email-imammedo@redhat.com>	<87vbrpe4qa.fsf@blackfin.pond.sub.org>
	<20140625135126.64cc15d8@nial.usersys.redhat.com>
In-Reply-To: <20140625135126.64cc15d8@nial.usersys.redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: fix warning
 'res' may be used uninitialized
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
X-List-Received-Date: Wed, 25 Jun 2014 19:10:38 -0000

Am 25.06.2014 13:51, schrieb Igor Mammedov:
> On Wed, 25 Jun 2014 11:08:29 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
> 
>> Igor Mammedov <imammedo@redhat.com> writes:
>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>
>> Broken in commit 9005b2a (author cc'ed).  Bites only when passed zero
>> len, which seems unlikely.
>>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
> 
> main motivation for the patch was to allow -Werror=all build pass.
> 

As I sent an identical patch some minutes ago, I can add

Reviewed-by: Stefan Weil <sw@weilnetz.de>


