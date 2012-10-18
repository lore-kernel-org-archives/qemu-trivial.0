Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOt7b-0005Za-2R
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 12:38:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TOt7U-0005MI-OA
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 12:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TOt7P-0002ri-5N
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 12:38:52 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:65432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TOt7P-0002rL-0r
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 12:38:47 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so13744974iea.4
	for <qemu-trivial@nongnu.org>; Thu, 18 Oct 2012 09:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=WcO/09Lzhe5A+LVMv7CJvj3zv0+Zq4RVh1lSThO4xx4=;
	b=nRH0Ui2Uyq8gZISupO4lhXU8EdxSWBpTpPmMsu4/NRUXZl9sdAnxPDQ7qQh1Y4PYzC
	R1FGGmWp1teiGPKT2BZib8y7ifF29N5t3u16Xae+PnRSi4wKu/rTWspgILAA1vbNrK7e
	JfwHC3pBp9KKGTkn0r3SXT5GDuZ6nR/hQMVEf8fOs0yD1/T9z44OKFaXCMUgG0VX8QOT
	66gDOwcCCokY5/5NxLS86zbpc778YFkDXFbX7LuV/DEUv783eSdJTSBLv1f3jzPNUpVo
	nSimG/Lqqo1Bv9FLcxhTvRBQ+7DsUZ7/DWthxDbeRzo5I0WkNtsZB+9TEC7Bwii+QIC5
	xrfA==
MIME-Version: 1.0
Received: by 10.50.47.227 with SMTP id g3mr5623078ign.5.1350578326307; Thu, 18
	Oct 2012 09:38:46 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Thu, 18 Oct 2012 09:38:46 -0700 (PDT)
In-Reply-To: <508029B6.8060301@weilnetz.de>
References: <1350572612-24268-1-git-send-email-peter.maydell@linaro.org>
	<508029B6.8060301@weilnetz.de>
Date: Thu, 18 Oct 2012 17:38:46 +0100
Message-ID: <CAFEAcA-9beV0vqed4asU+ePBaq_Uzsxjoa3enNQaGFfUCHQcGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlTQBVxhEHb8gj2tn4RrEFXZu/SabAEBWZcJDfXA2wNOkneuZr6o4Q2ReUCdU2MqfpXD66/
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/vnc-jobs.c: Fix minor
	typos in comments
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
X-List-Received-Date: Thu, 18 Oct 2012 16:38:57 -0000

On 18 October 2012 17:09, Stefan Weil <sw@weilnetz.de> wrote:
> Am 18.10.2012 17:03, schrieb Peter Maydell:
>> - *                      if two threads try to write on it at the same
>> time
>> + *                          two threads try to write on it at the same
>> time
>
>
>
> Did you remove the 'if' intentionally? Then I'd expect a comma after
> 'corrupted', because 'two threads try to write ...' is a new sentence.

No, that was a careless error on my part; the edit was just intended to
remove the hard tabs on that line. I'll send a fixed patch.

-- PMM

