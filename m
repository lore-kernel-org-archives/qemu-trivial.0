Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fZJBo-0002OY-3U
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jun 2018 12:57:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fZJBl-0002NO-Uv
	for qemu-trivial@nongnu.org; Sat, 30 Jun 2018 12:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fZJBl-0006rq-Bg
	for qemu-trivial@nongnu.org; Sat, 30 Jun 2018 12:57:34 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fZJBf-0006eH-3b; Sat, 30 Jun 2018 12:57:27 -0400
Received: by mail-qt0-x241.google.com with SMTP id y5-v6so847992qti.12;
	Sat, 30 Jun 2018 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RCEbBah4jIZ2DkMW5xBOI+OPT0OfA0d/t7meMYzmHFQ=;
	b=U28TBpj4AXt1SDD+UhOt+TswYWVUY0pY+Lj/SlRHnp+7nvYq20zNosy6x6tEfHJ8Ot
	+9NbS2RAHb7PZ1a9WQseTZggBNoZYQbUZ8kKP3I0UhPuRSaPq279N6W+P0uV30h4N5qX
	C0p7FWHWrsnGAQq+S67JUAePV+FeABph+67fmuQTF3sQfuKbjatSSo4h86u8N93bRnoM
	Cwf5ZMmRcay2u8kG57Y1r8P5YJyzz05I/mrPFSPfexIc9dMy/YQY9vJANzg+DYv8CpFv
	RD7DxchF7jNGPeiciJDSEXzjICtn1q8ecApcmneWNjqG0+zIiCm6eoAz1NbB6F24o+31
	BPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RCEbBah4jIZ2DkMW5xBOI+OPT0OfA0d/t7meMYzmHFQ=;
	b=A4QOH6/ZhgbPAZ+ehxtufV5JHgyF2pbDz7UzyLb5QL0rdo8pwBE8e/HhADaQTBY3Ob
	VEf3DXrmM3lP1AEIrrxtlAkzIJsi21baQ40/CI+rCtKAke/J4DePE7P+qBFpe+4Ytaht
	urOAffY0lHEI4JvdvDmOnr/SW4z06LIpdZyFklvI3x9DEdM4frH7A0jFB4fnNlb2MimZ
	z8p6Un1AF9omLSAXpnmVMFvKVitGKZE3RiqGEmSPT8/m2a8DC8wVy2H8r6dJjPLOXTjI
	7/qNM+PDcn3uJQJsMf+ZVTJdDYU5S7YAlCvjOykxeZ7gH4NCi7gkrTfQHjYtDXgkZJow
	9CiQ==
X-Gm-Message-State: APt69E0bMxj6EW37PGPaV+qM/Y1kfA8eg2lOouv2K6qjmmrMOCsGC4lo
	ZGdPhpSA3ATArjIIPWRMlRY=
X-Google-Smtp-Source: AAOMgpfCCfPt/b9F8nwJ4jqNMFYgPMB1be6tFClT194YEx7nTgIC59HgI/doyAf5tiAhsGp0EJGhNA==
X-Received: by 2002:ac8:3607:: with SMTP id m7-v6mr259950qtb.202.1530377846451;
	Sat, 30 Jun 2018 09:57:26 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m31-v6sm8288060qte.82.2018.06.30.09.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jun 2018 09:57:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20180621171257.14897-1-f4bug@amsat.org>
	<20180621171257.14897-6-f4bug@amsat.org>
	<20180622062225.ay4bubgshxjj3uey@sirius.home.kraxel.org>
	<3a5e52f6-3b65-5ce8-f5d2-48b76e3e4f21@amsat.org>
	<20180622123149.qxirhe6uajzkc22s@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f6854a8f-19bb-befc-42b4-bb6820813e2c@amsat.org>
Date: Sat, 30 Jun 2018 13:57:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622123149.qxirhe6uajzkc22s@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/11] hw/display/cirrus:
 Convert printf() calls to trace events
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
X-List-Received-Date: Sat, 30 Jun 2018 16:57:34 -0000

Can this patch go via the Trivial tree?

On 06/22/2018 09:31 AM, Gerd Hoffmann wrote:
>>> Indention looks weird.
>>
>> Actually this is the code around that is weirdly intended, a mix of
>> <tab> and <spaces>.
> 
> Ok.
> 
>> Do you prefer a previous indent cleanup patch or can I add your Acked-by
>> tag?
> 
> Leave as is.  Breaking "git blame" with a whitespace cleanup is not
> useful indeed.
> 
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> cheers,
>   Gerd


