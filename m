Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e59s9-0005EM-B4
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 08:24:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e59s6-0005Ax-Cx
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 08:24:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e59s3-0000F8-7r
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 08:24:22 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:50064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e59s3-0000Ep-37; Thu, 19 Oct 2017 08:24:19 -0400
Received: by mail-qt0-x244.google.com with SMTP id k31so14139896qta.6;
	Thu, 19 Oct 2017 05:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Cml1G+gery/4iV/pBVsrUU2pUT3QDwcjZMFhmlyQi9o=;
	b=k+mj1YueOJc1tFpTpwVpdy4RhUOQl65Rmkrw047VVPWK5JnNjtTB9stLPYH731vUDz
	g7l94uV+HxEbMEYrVEqQGXzMRp/son2zPLkVRTxUnuJYWYeOK8/+pueS2Bojq8VpefAg
	ozJneWQY9N6C/TvxqmKCiACthdtKJ5LQRnj3L4LDrVA8tyqCdyfVtI9qkRTHhKuTQozA
	sj/WvZB52C7GuUejQbyfsNdhPdgWY6cZOyl/SDSbfSRagHh24LysbH5NJszmZ4auBmtQ
	rla+NqUnSNYZzSjThPQnZKyswJPBf8399u2WetNr3LhZxih3pyyDxOuMi4Y8NRvwaeii
	2yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Cml1G+gery/4iV/pBVsrUU2pUT3QDwcjZMFhmlyQi9o=;
	b=eu2udYRTwHRWDM8vf9O1WIrSiz/Tm0qBJkHpCp/pAFxQwnnbXuwvjwrzNOg2CP3bw4
	IrPly15iChp7dcpLgSiClVRwsrSpltMNz32DVjDnlX8THF1zUtlsyEcIbNc/Tuy9hiYJ
	Hk9EYa5AoRLcmvJSBc6h8Y4tXxJ2Dlz81ANQ2MkRIa3KG+o1ZKMwXKmgvey/zkv4iBDF
	40r3LwSlxvyOyFSqLUPbJLf7dBR0gProEg+LdITGZkp6C8ORaOeLNiK+qjmGMYhYQnaB
	JF99lvX1bCKld//4oRrkGfFLbPdsho7Qtj6fBttz6reUz+8ifVjhasWtDfzh767qFoTp
	WXlQ==
X-Gm-Message-State: AMCzsaXTvy7hNI5p4q8RSDAEoJ0/JepdcGDm9aWHOWp3YMaXFGnPhB8B
	IbY9XRryOL1Y3ef1YZlfmW8=
X-Google-Smtp-Source: ABhQp+SI33l3hvt7rtM3NFU3DGVl0M4z04uMj6xOQD9DXphP+6TPs+TDcuI7ElJs2NYIIBCmqCFqwQ==
X-Received: by 10.200.43.26 with SMTP id 26mr1869126qtu.51.1508415858572;
	Thu, 19 Oct 2017 05:24:18 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	v30sm9423321qtg.88.2017.10.19.05.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 05:24:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <150841324224.31292.4012464539983692364.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <75a0ecaa-f45b-b4a8-131d-97b52fca2ccd@amsat.org>
Date: Thu, 19 Oct 2017 09:24:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <150841324224.31292.4012464539983692364.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH] docker: fix out-of-tree 'make
 docker-test-build@debian-powerpc-cross'
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
X-List-Received-Date: Thu, 19 Oct 2017 12:24:23 -0000

On 10/19/2017 08:40 AM, Greg Kurz wrote:
> Without this patch, it fails with:
> 
> IOError: [Errno 2] No such file or directory:
>  'tests/docker/dockerfiles/debian-apt-fake.sh'

Yes, my bad :)

I have the same fix in my CI-WIP branch which sadly lacks of love.

> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tests/docker/Makefile.include |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 6f9ea196a7b8..5d54eca5d0b3 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -44,7 +44,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>  		$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)),\
>  		"BUILD","$*")
>  
> -docker-image-debian-powerpc-cross: EXTRA_FILES:=tests/docker/dockerfiles/debian-apt-fake.sh
> +docker-image-debian-powerpc-cross: EXTRA_FILES:=$(SRC_PATH)/tests/docker/dockerfiles/debian-apt-fake.sh
>  
>  # Enforce dependancies for composite images
>  docker-image-debian: docker-image-debian9


