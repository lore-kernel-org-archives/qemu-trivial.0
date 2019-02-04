Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqnjI-0003no-Du
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 18:32:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnjE-0003lA-Is
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:32:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnjA-0002ik-OJ
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:32:38 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37337)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gqnjA-0002cb-FR
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:32:36 -0500
Received: by mail-wr1-f68.google.com with SMTP id s12so1772829wrt.4
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 15:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tAcTGRF/wyEZHcc+X6FE4pwFwmX1GZq3T07X0d/BUbA=;
	b=NKjG5g8E8Ij3YIXitGVzVJRly4dRqJpv79g7HHklVMBQ1qt5Zh9z9L74SQrOI3XsTC
	Opa4uRcHi9wiTGV5kagINtoORR9P7+LrtuDwTY0IFdwXBby7vjjVQs9tUXPmmjAqB2Z2
	kpd46K6BPiMb9RqzCVA0wgxukHQnZy8qutyLpUfHkdakZyuV8urAQW3/vxP3gPupF4Ou
	UtNwYOBuIw9NBHG1XYXYkM5s3pyGcEgDc8YKJMNOfqQ0IYrHx9ak0SHXbgf06MJr5rwn
	ayLkh+Epjk1UHjbBGC/dznqRwGHLs7N/Jza10cqS92lijrdFU7CMsTlSHsQxKBj26NwS
	JTdQ==
X-Gm-Message-State: AHQUAubS9ki/D/1oz7h4WohXOgIja1cEnyQk4ng5URneYh33jwXuBSb8
	0dDnDaA5QxRsvmSW31JNZ/57yg==
X-Google-Smtp-Source: AHgI3IZw7gtmgupNS/q/TZDmhuIackOH/OU+oL7564LPfUHkbX2ZkOCg/lGCQXAlZSMntwq2ubfFCA==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr866041wrp.74.1549323147374;
	Mon, 04 Feb 2019 15:32:27 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	i192sm12438562wmg.7.2019.02.04.15.32.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 15:32:26 -0800 (PST)
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: fam@euphon.net, qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, patchew-devel@redhat.com
References: <154931335810.29184.7999220470596987389@ebba9967afc0>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <add6e25b-d3e8-e352-6a0f-2457555f2dfd@redhat.com>
Date: Tue, 5 Feb 2019 00:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <154931335810.29184.7999220470596987389@ebba9967afc0>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/input/tsc210x: Fix
 building with no verbosity
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
X-List-Received-Date: Mon, 04 Feb 2019 23:32:42 -0000

On 2/4/19 9:49 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190204204517.23698-1-philmd@redhat.com/
> 
> This series failed the docker-mingw@fedora build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> time make docker-test-mingw@fedora SHOW_ENV=1 J=14
> === TEST SCRIPT END ===
> 
> The full log is available at
> http://patchew.org/logs/20190204204517.23698-1-philmd@redhat.com/testing.docker-mingw@fedora/?type=message.
> ---

Full log is weird:

Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
From https://github.com/patchew-project/qemu
 - [tag update]
patchew/20190117215300.29694-1-brijesh.singh@amd.com ->
patchew/20190117215300.29694-1-brijesh.singh@amd.com
fatal: Unable to create
'/home/patchew/.cache/patchew-git-cache/httpsgithubcompatchewprojectqemu-3c8cf5a9c21ff8782164d1def7f44bd888713384/refs/tags/patchew/20190204204517.23698-1-philmd@redhat.com.lock':
File exists.

If no other git process is currently running, this probably means a
git process crashed in this repository earlier. Make sure no other git
process is running and remove the file manually to continue.
Unexpected end of command stream
error: Could not fetch 3c8cf5a9c21ff8782164d1def7f44bd888713384
Traceback (most recent call last):
  File "patchew-tester/src/patchew-cli", line 521, in test_one
    git_clone_repo(clone, r["repo"], r["head"], logf, True)
  File "patchew-tester/src/patchew-cli", line 48, in git_clone_repo
    stdout=logf, stderr=logf)
  File "/usr/lib64/python3.4/subprocess.py", line 558, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['git', 'remote', 'add', '-f',
'--mirror=fetch', '3c8cf5a9c21ff8782164d1def7f44bd888713384',
'https://github.com/patchew-project/qemu']' returned non-zero exit status 1

