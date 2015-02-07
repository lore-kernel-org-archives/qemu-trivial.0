Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKBZx-0001WV-Dv
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 15:02:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YKBZv-0001UW-Jh
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 15:02:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YKBZr-0007yz-Kz
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 15:02:07 -0500
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:51224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YKBZr-0007xp-FI; Sat, 07 Feb 2015 15:02:03 -0500
Received: by mail-wi0-f173.google.com with SMTP id em10so2013283wid.0;
	Sat, 07 Feb 2015 12:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=E/uwBqJXGvV41vnMVuKFeS8NlNGQR6Ro/wd97BWMZjc=;
	b=V1xsjPsO6kocF8/iDIPPlBHlB/Gky2cNVOaLMUuq/mw2/t/X4/lqOdaFjhd+jxzIvs
	ZidzVvSErNGhTyCpPN+y1E/tGYyjnAdfIGjQpa1ZKAG0uqRSH39HEmvD9fHf9tWiYiQ5
	XtaMz02WstBFXrO6pcmvf7wq6lFpLX5EeGSNyjRISFJTsWepF/GbY8iCVjPJwk31B5e1
	jjNRFSm6kgTEVhU8mWQG323cvKoOgre0pa9Ce+/lFshLgIeh/aNSVQ0/jfEjHwiQw0AY
	UjJkpZLDxPDv768XGhcpScUaGIO9Ls/Rok39US9H/KNWr4fMGl6CRjaGS/Hk/x/CeTpW
	3C9A==
X-Received: by 10.194.234.40 with SMTP id ub8mr13382398wjc.100.1423339322743; 
	Sat, 07 Feb 2015 12:02:02 -0800 (PST)
Received: from [192.168.10.150] (net-93-66-105-136.cust.vodafonedsl.it.
	[93.66.105.136])
	by mx.google.com with ESMTPSA id ha1sm6914070wib.24.2015.02.07.12.02.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Feb 2015 12:02:01 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54D66F36.5080200@redhat.com>
Date: Sat, 07 Feb 2015 21:01:58 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
	<54D5D416.6040704@msgid.tls.msk.ru>
In-Reply-To: <54D5D416.6040704@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	armbru@redhat.com, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/7] Six coverity fixes and a cleanup
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
X-List-Received-Date: Sat, 07 Feb 2015 20:02:08 -0000



On 07/02/2015 10:00, Michael Tokarev wrote:
>> > Patch 2 is the cleanup.  The other six patches make the tcg, utils and
>> > migration components clean.
> Applied to -trivial patches 1,2,3,4 and 6, not applied 5 (due to
> questionable errno checking addition) and 7, due to a discussion.

Thanks, will resubmit 5.

Juan/Amit, can you pick up 7 which Juan has already reviewed?

Paolo

