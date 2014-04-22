Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WcP4g-0004Ab-Mm
	for mharc-qemu-trivial@gnu.org; Mon, 21 Apr 2014 21:00:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WcP4V-0003t7-Vd
	for qemu-trivial@nongnu.org; Mon, 21 Apr 2014 21:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WcP4M-0001vO-MU
	for qemu-trivial@nongnu.org; Mon, 21 Apr 2014 21:00:27 -0400
Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a]:55366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WcP4M-0001vI-EN; Mon, 21 Apr 2014 21:00:18 -0400
Received: by mail-pb0-f42.google.com with SMTP id un15so337145pbc.1
	for <multiple recipients>; Mon, 21 Apr 2014 18:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Rs25G7rbQzIxqJCnV0M9iYEmDWXGMU4QYnM/mJCEti0=;
	b=zlWaEd5oU3Xiv/cdfLxPkCmSvAEK3bku+9W7mZ2sk3AI4TQLwJVzrWK/oPDOjwQtwP
	kxkREdMce+G4zWehCmA0wV8X9miDFig5o8Zgvo82xi9R1LWM0N/jLITJ5c85iCm+V8cv
	LmQbH0Yhh8Ga+XEegUQrPmAA868NLhcifYrCHKf/fz4EDmd+swPTmi5a2RL0gA+Im0M+
	3ovuch+r3EQ4HIQMFFJJcCjbayI9DYCtTerv3S9ykTlLvEKkuYPfJCCt0Z/CYG54cQ9T
	dcJam5+m77gFKJv2Uayc0JoLPxeifEQYYOOyjFsivkPxfSyVT0dJAkzxo+6IksYjmDO9
	obKA==
X-Received: by 10.66.66.66 with SMTP id d2mr40890106pat.24.1398128416681;
	Mon, 21 Apr 2014 18:00:16 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.236.72])
	by mx.google.com with ESMTPSA id
	pv4sm80794745pbb.55.2014.04.21.18.00.13 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Apr 2014 18:00:16 -0700 (PDT)
Message-ID: <5355BF1B.2030302@gmail.com>
Date: Tue, 22 Apr 2014 09:00:11 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	mjt@tls.msk.ru, aliguori@amazon.com
References: <5353B7F9.4060803@gmail.com> <5355349E.6060601@redhat.com>
In-Reply-To: <5355349E.6060601@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22a
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] vl: Avoid to close
 stdout after finish 'writeconfig' option
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
X-List-Received-Date: Tue, 22 Apr 2014 01:00:37 -0000



On 04/21/2014 11:09 PM, Eric Blake wrote:
> On 04/20/2014 06:05 AM, Chen Gang wrote:
>> After finish 'writeconfig' to stdout (with '-'), we want to copy/past
>> the related information mannually, not for redirection ('readconfig'
>> does not support '-').
>>
>> So we can not close the stdout, or next options which may use stdout
>> will not be displayed.
> 
> Grammar, and awkward to read.  May I suggest:
> 
> vl: avoid closing stdout with 'writeconfig'
> 
> 'writeconfig' supports output to stdout (with '-'); when that happens,
> we must not close stdout, or further command line options that also use
> stdout will be impacted.  (Although 'writeconfig' was copied from
> 'readconfig', the latter does not have the problem because it does not
> support reading from '-')
> 
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  vl.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> With the improved commit message,
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> 

OK, it sounds fine to me, I shall send patch v2 for it.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

