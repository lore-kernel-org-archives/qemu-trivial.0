Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUjEl-0004GS-2j
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 18:32:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZUjEi-0004CZ-3H
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 18:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZUjEh-0008V5-Cq
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 18:32:04 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:38587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>)
	id 1ZUjEb-0008Rx-E9; Wed, 26 Aug 2015 18:31:57 -0400
Received: by wicja10 with SMTP id ja10so28116423wic.1;
	Wed, 26 Aug 2015 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ydtOlyGvN4MaPrfVu5NvwWt6BQUnd+DMeosmmPT6qEo=;
	b=Pr0NLJdKeS9B1Kh6Zwsxb15n8T+klgRsLt+TuAeo9JAtTMhrP7Jx7vwGXJy6vpGIr8
	/K/78TyvAOgMRqrp8bP/n8RCrPsyxEJb6Oq/2NKrmBE4XzbvYdJdkmP3cZmeLHOcb8MW
	lLBoKls+iTC5t4BjfmnyZNwGFe7LmgV8hPbZ0V1qLmjyQ3WRi1+UBF3A4oO3JOgId4FS
	6sSNAo86qieXzUc6VTHe6sXbIRWzhrxh7spmCdf9TsJzXv6bcun5pga6rzS/emI2wvJr
	YJ+2yWuXq6eot7L+RsqBXrYnainAQsx+ZSw5epN6XFihFRzLclxSrSeRo36tbJBvtTEO
	bC1w==
X-Received: by 10.194.238.168 with SMTP id vl8mr748102wjc.128.1440628316299;
	Wed, 26 Aug 2015 15:31:56 -0700 (PDT)
Received: from [10.248.117.5] (92-249-200-64.pool.digikabel.hu.
	[92.249.200.64]) by smtp.googlemail.com with ESMTPSA id
	uo6sm181556wjc.1.2015.08.26.15.31.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Aug 2015 15:31:55 -0700 (PDT)
From: "=?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?=
	<DirtY.iCE.hu@gmail.com>
To: Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
	<CAJSP0QXj07FKi9g0B6mF9nbZi-inPQMEFrVZ_a6w5WPwbJycLQ@mail.gmail.com>
	<878u8ynqbx.fsf@blackfin.pond.sub.org>
Message-ID: <55DE3E58.4070906@gmail.com>
Date: Thu, 27 Aug 2015 00:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <878u8ynqbx.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	"open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] opts: produce valid
 command line in qemu_opts_print
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
X-List-Received-Date: Wed, 26 Aug 2015 22:32:05 -0000

2015-08-26 15:15 keltezéssel, Markus Armbruster írta:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
>> On Tue, Jul 7, 2015 at 3:42 PM, Kővágó, Zoltán <dirty.ice.hu@gmail.com> wrote:
>>> This will let us print options in a format that the user would actually
>>> write it on the command line (foo=bar,baz=asd,etc=def), without
>>> prepending a spurious comma at the beginning of the list, or quoting
>>> values unnecessarily.  This patch provides the following changes:
>>> * write and id=, if the option has an id
>>> * do not print separator before the first element
>>> * do not quote string arguments
>>> * properly escape commas (,) for QEMU
>>>
>>> Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>> Feel free to send a "Ping" email reply if your patches haven't been
>> reviewed after about 1 week.
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Route via qemu-trivial or qemu-block?
>

Hmm, I originally intended qemu-trivial, qemu-block was added via 
scripts/get_maintainer.pl.

Zoltan

