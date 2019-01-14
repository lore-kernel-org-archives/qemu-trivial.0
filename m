Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj035-0006EM-89
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 06:04:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj02y-0006Ag-Fe
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:04:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj02s-00062v-Sy
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:04:48 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj02s-00061J-LY
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:04:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so22286418wrx.9
	for <qemu-trivial@nongnu.org>; Mon, 14 Jan 2019 03:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NKx2labRXPlAzJZ2XyiRUjQmaYizSbXCBX01vVnhebE=;
	b=Alq2D711NerCQcxSTDkthLs8ee7YUU0spg9nMgmPaHVlMTAECPU9k6PvEuuxuBe9cM
	raxRhBt/6Lxb32xT58038W0wn8Y+Ty2IO0b6nnLvEroNAcw7OWYpsMsP/2o3NIsK7OKZ
	QoV31fvfXhCQ40uxwS/pABuF85WyRx+us4Wx/sXy+gozyoC2MJSzTioG7+lILRuM+OL+
	1IOifaPDRpB2UeNUO2fPtzdP3tAfIzly8/A+8EixEtpGqTCKCrkxKZkxHRAbp02a5ysr
	lpUSScFfx0OKIXuLyxFpkvzBuTre3FxyOBDK8nQcn6eBWjeiRP3BgCf7y6xBx4xRZAJk
	y6PQ==
X-Gm-Message-State: AJcUukc6ME1eNg2xDpc9VZdqsA79/fjWCo3ME467lnv3G4arUkYjQ5vi
	dj4pSoSVLvwfSgcbc0N6oXYlxQ==
X-Google-Smtp-Source: ALg8bN77E8vtN1EW1bjuC9JnLj7MLT7E/QT4O8cD6DZWFbDamyZNw2cnFEX+QcRsqikgzN085B8mLg==
X-Received: by 2002:adf:c452:: with SMTP id a18mr24204837wrg.145.1547463881705;
	Mon, 14 Jan 2019 03:04:41 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	b129sm25018204wmd.24.2019.01.14.03.04.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 03:04:41 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Cleber Rosa <crosa@redhat.com>
References: <20190111201330.14473-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <05f29d1e-11f0-62e0-af82-02a989e1c7b7@redhat.com>
Date: Mon, 14 Jan 2019 12:04:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190111201330.14473-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu.py: Fix error message
 when qemu dies from signal
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
X-List-Received-Date: Mon, 14 Jan 2019 11:04:54 -0000

Hi Eric,

On 1/11/19 9:13 PM, Eric Blake wrote:
> When qemu dies from a signal, the python code gets a negative
> value for exitcode; but signal numbers are positive.  Copy the
> pattern used in qemu-iotests/iotests.py for reporting a positive
> value.
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  scripts/qemu.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qemu.py b/scripts/qemu.py
> index 6e3b0e67719..0a5e02eb56e 100644
> --- a/scripts/qemu.py
> +++ b/scripts/qemu.py
> @@ -351,7 +351,7 @@ class QEMUMachine(object):
>                  command = ' '.join(self._qemu_full_args)
>              else:
>                  command = ''
> -            LOG.warn(msg, exitcode, command)
> +            LOG.warn(msg, -exitcode, command)

What about displaying signal name directly?

import signal

...

            msg = 'qemu received %s: %s'
            ...

            LOG.warn(msg, signal.Signals(-exitcode).name, command)

> 
>          self._launched = False
> 

