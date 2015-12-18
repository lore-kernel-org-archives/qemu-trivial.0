Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9uln-00076H-74
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 08:08:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1a9ulk-00072b-QO
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:08:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1a9ulj-0001qG-Sk
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:08:24 -0500
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:51597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1a9ule-0001oy-Gy; Fri, 18 Dec 2015 08:08:18 -0500
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 51DDB101E05;
	Fri, 18 Dec 2015 14:08:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ts1jYzOq-YyY; Fri, 18 Dec 2015 14:08:17 +0100 (CET)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 2E7E3101A39;
	Fri, 18 Dec 2015 14:08:17 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1450443571-14621-1-git-send-email-peter.maydell@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <56740546.7070503@weilnetz.de>
Date: Fri, 18 Dec 2015 14:08:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450443571-14621-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: Blue Swirl <blauwirbel@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/checkpatch.pl:
 Don't allow special cases of unspaced operators
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
X-List-Received-Date: Fri, 18 Dec 2015 13:08:26 -0000

Am 18.12.2015 um 13:59 schrieb Peter Maydell:
> The checkpatch.pl script has a special case to permit the following
> operators to have no spaces around them:
>  <<  >>  &  ^  |  +  -  *  /  %
> 
> QEMU style prefers all operators to consistently have spacing around
> them, so remove this special case handling. This avoids reviewers
> having to manually note it during code review.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I actually thought failing to point out the lack of spaces was
> a checkpatch parsing bug until I looked in the source and found it
> was deliberate...
> 
> I say "QEMU style prefers", but possibly what I actually mean is
> "I prefer" ? Does anybody want to defend the unspaced versions?


I don't. Therefore

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Cc'ing QEMU Trivial, maybe it can be applied there.


> 
>  scripts/checkpatch.pl | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b0f6e11..efca817 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1890,19 +1890,6 @@ sub process {
>  						ERROR("space prohibited after that '$op' $at\n" . $hereptr);
>  					}
>  
> -
> -				# << and >> may either have or not have spaces both sides
> -				} elsif ($op eq '<<' or $op eq '>>' or
> -					 $op eq '&' or $op eq '^' or $op eq '|' or
> -					 $op eq '+' or $op eq '-' or
> -					 $op eq '*' or $op eq '/' or
> -					 $op eq '%')
> -				{
> -					if ($ctx =~ /Wx[^WCE]|[^WCE]xW/) {
> -						ERROR("need consistent spacing around '$op' $at\n" .
> -							$hereptr);
> -					}
> -
>  				# A colon needs no spaces before when it is
>  				# terminating a case value or a label.
>  				} elsif ($opv eq ':C' || $opv eq ':L') {
> 


