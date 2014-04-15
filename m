Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa1BX-0004zE-4R
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 07:05:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa1BM-0004z1-UY
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 07:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa1BD-00054Y-LV
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 07:05:40 -0400
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:34040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wa1BD-00054L-D6; Tue, 15 Apr 2014 07:05:31 -0400
Received: by mail-pa0-f54.google.com with SMTP id lf10so9505402pab.13
	for <multiple recipients>; Tue, 15 Apr 2014 04:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=qNmi04tGcOHDFD+HpzGom9aRvS9iaYPt9/XbgGzvcW8=;
	b=IQzvijrsMdE7H+se4YgidQiuBc7kiup4dwpTvYwcSH61OX5y1/Kb8cq9WuVg+fTSL6
	SAshsMLgku2WUnKemmPbYfXtVP6uc+by0c/VUnHm9H8ksU97JLuSI990QcBMgssPJegf
	9yUQQJiYJYnG8EwUuyKBywqn4nCMTrfuKOvzZ2vhxQ9plkQcQIbqzz7UtHqpoiF30VFv
	3SZRvk7/z9sFUym7aW+LpwnHf3CHTVj2FfvdCLm9g4x5xfYoETRhH5z4S0L3DHAoLr55
	UG47+8TYpV/nVtS/xZqNJPzk5Vh7r+fUeXSN7l9LfTpz2sPa3Dq96EMIdsYS7vlqeOzL
	aiZg==
X-Received: by 10.68.230.41 with SMTP id sv9mr1172892pbc.23.1397559930427;
	Tue, 15 Apr 2014 04:05:30 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.91.142])
	by mx.google.com with ESMTPSA id
	wp3sm39590931pbc.67.2014.04.15.04.05.25 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 04:05:29 -0700 (PDT)
Message-ID: <534D1271.1000606@gmail.com>
Date: Tue, 15 Apr 2014 19:05:21 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <53337BEB.90305@gmail.com>
	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>
	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>
	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>
	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>
	<5343E4D4.6070305@gmail.com>	<5343E516.3020103@gmail.com>
	<87lhv7gemz.fsf@blackfin.pond.sub.org>
In-Reply-To: <87lhv7gemz.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 1/3] vl: remove
	useless 'continue'
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
X-List-Received-Date: Tue, 15 Apr 2014 11:05:50 -0000



On 04/15/2014 04:50 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> Normal "if (...) {...} else {...}" is enough in "while(...) {...}", not
>> need additional useless 'continue'.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  vl.c |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 9975e5a..7505002 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)
>>          if (argv[optind][0] != '-') {
>>              /* disk image */
>>              optind++;
>> -            continue;
>>          } else {
>>              const QEMUOption *popt;
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

OK, thanks.

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

