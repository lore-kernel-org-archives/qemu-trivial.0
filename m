Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7Lm2-00024o-Jp
	for mharc-qemu-trivial@gnu.org; Wed, 25 Oct 2017 09:31:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e7Llv-00022s-M6
	for qemu-trivial@nongnu.org; Wed, 25 Oct 2017 09:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e7Lls-0006Ja-Ir
	for qemu-trivial@nongnu.org; Wed, 25 Oct 2017 09:31:03 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:51692)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e7Lls-0006JT-El; Wed, 25 Oct 2017 09:31:00 -0400
Received: by mail-qt0-x241.google.com with SMTP id h4so34724232qtk.8;
	Wed, 25 Oct 2017 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RA9fKswXEHRMke35cvyDKu7tIfU3YXaU/3eHvb7C4VQ=;
	b=JlrKyO7I/Xyr6zcAv/pao+aEPRk27QQ+/Yt3qtA9nM+RF8U8x4Uq8LK34VAPQ6ZY2m
	VyDe0h7gAVB7RCdyU0YFCpze3iuv3It+n8NWbH7G3RgY38EGd7d/TVpPL7BCu31mqUNB
	wU0ExUXzK0f0VwBP2trd+YN41XP1754iykP/41uLGflW8g9mstJO7sGP5I/LhW8E6Tv8
	5IIA67yXeRZ36obtCsxVk2Yqfe6PlwWFsjSF5Q7gQwLSW/K6QWQs3Ia1RSx+oC5jc4xL
	pETd/I0zoiEbCqRN1cg1PfP/At/WftGilHJqMHL4drKJMPuB3HtoQvHbpDkOmhX7Zx5Z
	5T/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RA9fKswXEHRMke35cvyDKu7tIfU3YXaU/3eHvb7C4VQ=;
	b=cnT27uvVGdrWzjvUXAkgVrD+gJbtO2x3MMBlYDNTwg3OHPzhdlvFHVt8yw3+lGB4D+
	dE4mx/MyVRM0z1o0HhEx87C3G7OMW1BkSy5Pj0F/5WiQk+gujMS7/zZ1GbvxcfLnQ8X5
	vYKR5dpjIcrpSKW+5RYITeqxZ4MqHs4G4u0eMtxuFWaekmxdJVfVRr4SbBjkIJJ1Cayx
	ttoQQ6yDfeZbFGpb86y31FkhOAAKMXfzNh9mF+5p4nlYrjjwED34Ez9AfpqpPqxML9Xo
	B0YDcTvpNrNZwxOidOBHCcZyi6XlssvsbxI2Ug/ED2NZgu12U8Z+TX1CUCohsUUaoCyk
	nlyQ==
X-Gm-Message-State: AMCzsaV2auxkqpyzqxFZNkBfFXcNdfbkuRmdLL4yoU6ZF1UJz81QPtg5
	NMlNO8X0ZmKj3qFVtSuhlxQ=
X-Google-Smtp-Source: ABhQp+R4Kl8QaYRMAh0Grl7Q6/bAWAbWmAfFVdX6DIgibDzAngNWx9XuP7l8ePS5ph8D6K1nNt6DNQ==
X-Received: by 10.237.60.148 with SMTP id d20mr31210903qtf.118.1508938259785; 
	Wed, 25 Oct 2017 06:30:59 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	y29sm1961897qtk.64.2017.10.25.06.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Oct 2017 06:30:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: amarnath.valluri@intel.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>, Peter Xu <peterx@redhat.com>, 
	qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@gmail.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>
References: <20171024122045.30072-1-f4bug@amsat.org>
	<1508869162.4025.1.camel@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <01856102-8692-2fcb-9c69-000a4236b2ad@amsat.org>
Date: Wed, 25 Oct 2017 10:30:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508869162.4025.1.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/4] tpm: add stubs to
 fix compiling with --disable-tpm
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
X-List-Received-Date: Wed, 25 Oct 2017 13:31:09 -0000

Hi Amarnath,

On 10/24/2017 03:19 PM, Amarnath Valluri wrote:
> On Tue, 2017-10-24 at 09:20 -0300, Philippe Mathieu-Daudé wrote:
>> This fixes building with --disable-tpm as reported by Zoltan:
>>   http://lists.nongnu.org/archive/html/qemu-devel/2017-10/msg05369.html
[...]
> +1, Nice cleanup in my opinion, now it looks much cleaner.

Thanks, however I'm not sure what a +1 means, is it equivalent to an
Acked-by or a Reviewed-by tag? If so it would be better to write them
explicitly.

Regards,

Phil.

