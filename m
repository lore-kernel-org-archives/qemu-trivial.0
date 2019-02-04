Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqcjw-0007YV-QY
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 06:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqcju-00077C-O3
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 06:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqcal-0007g0-KP
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 06:39:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gqcal-0007fH-9T
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 06:39:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id s12so14021582wrt.4
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 03:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7hwSSBQlIC0rD/Wk2Kw2y+eyvk7tbfyLhDm9t+vo4JM=;
	b=DoQ9+veEN+Bg0GByN8H45qd5Q9jUL1RX57qdWn3RKvA3kjC1th47fbZjvVi57XHNeC
	Wx7TWyu5LQzPJFoBFogZ88vM1pJmF4eh8f6LP7qsY/gG6uJlHGABwYhP1EIZGoiRhagn
	PENNAxl7f/eQH1/OMst9+a4Qkcs9yGLk6keQv6yD5B4ajJc5HI6mLXZN2TVHUDdY6UFq
	5nAJnB8nJlc81yKRwX3Wibzvmi9sDvoz9AgMucWZw/60eFloavu8oqIsz4i6dGu4nqzt
	NUoygvzbn9u6dayzqgsWORRk8t9StfdmUvOYDWdJ1dreD6S79h55YPPF0JFxxecosarc
	zPaw==
X-Gm-Message-State: AHQUAubkASXEWDouBhPzeBsi6SQP46x6L0S4lhG7JXF5gLMKYXCz3GWQ
	i394lKMz8OxlC1NQS9YZe7ZSBfMeYzs=
X-Google-Smtp-Source: AHgI3IZ+1ywuPGq9nCamzFC+iZ9dwKSp2nUIhnAGaoJbqbJCsuujq/IhPhSeC4+5WIfJIxgNuMnUMw==
X-Received: by 2002:adf:f1c5:: with SMTP id z5mr6682193wro.118.1549280348915; 
	Mon, 04 Feb 2019 03:39:08 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110])
	by smtp.gmail.com with ESMTPSA id h9sm2875668wrm.49.2019.02.04.03.39.07
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 03:39:08 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org
References: <1549268743-18502-1-git-send-email-thuth@redhat.com>
	<20190204101944.GE1905@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <483741c5-3b85-6690-282b-b715cf5ce3b8@redhat.com>
Date: Mon, 4 Feb 2019 12:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204101944.GE1905@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [PATCH] tests/docker/test-mingw and docs: Remove
 --with-sdlabi=2.0
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
X-List-Received-Date: Mon, 04 Feb 2019 11:48:39 -0000

Hi Alex,

On 2/4/19 11:19 AM, Daniel P. Berrangé wrote:
> On Mon, Feb 04, 2019 at 09:25:43AM +0100, Thomas Huth wrote:
>> Patchew currently reports failures with the mingw docker test - this
>> is due to --with-sdlabi=2.0 configure flag which does not exist anymore.
>> Remove this remainder from the docker test and the docs now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  docs/multiseat.txt      | 2 +-
>>  tests/docker/test-mingw | 3 +--
>>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

IMHO this patch can probably get directly applied as a build-fix, rather
than going thru qemu-trivial. Alex is that OK with you?

Regards,

Phil.

