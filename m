Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Czn-00017W-4i
	for mharc-qemu-trivial@gnu.org; Fri, 06 Sep 2019 08:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Czl-00016M-1q
 for qemu-trivial@nongnu.org; Fri, 06 Sep 2019 08:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i6Czj-0006zR-Om
 for qemu-trivial@nongnu.org; Fri, 06 Sep 2019 08:05:40 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i6Czj-0006ye-HA
 for qemu-trivial@nongnu.org; Fri, 06 Sep 2019 08:05:39 -0400
Received: by mail-wm1-x343.google.com with SMTP id t9so6791946wmi.5
 for <qemu-trivial@nongnu.org>; Fri, 06 Sep 2019 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=PKaq9aYEPNk74e8hjoIbfDyHl7tRTrakIeUd3w1Ns4A=;
 b=ZDWTqJdw3YLYe5R43DJUjcaX0nw1W7OsUfoQcU5fmbzLkLGpgzDf6aPCwLTr4PiUQE
 YWNaT6MGJ9cM4+ekwWHNK10D2psZfmHN74TSiSf7RWigRrhxOnaKyXblis4nB9MAyH4w
 mT3EJDXoDe8KSUYNyFJfv/GP7DXZtuTjkfkEDIBcyzmzbSazKEWDlWEWFr+Fb91xHZhg
 +A/UMPnqVmkKAkyB0NNh4UrwLoXJlTH4isHEt7rE+wuW9X5Mj665fh9Z1lwdjuMWo1ob
 /K5EeDPflBUoh2USzCZYvFx+VWdlsKvZT1f+osHnLgeuLSpfkiaQOnx+SZQoxDaUaapN
 vj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=PKaq9aYEPNk74e8hjoIbfDyHl7tRTrakIeUd3w1Ns4A=;
 b=EuIYNhLU6i+j+h1CzoHRWs2YAO+ZztEvn5Y/7Ssgk6zLNfcEero36PVOt3+D8CUK3M
 T9cxC/PfiGl4/o+YlcIxkU0vj/+pEjOfHCjhBp0aoepykiRn6yDR/HMZnXGC+ZnDb5dj
 4eQkSKoPYMaY80WeUIECQF7xWE8MhkYwA1gqQlPwpHBuF4oMjVTQKvJaYoScu02AxBMg
 uxf5OWYbdwc6VWxD0LI3BMyN55xxkNru68dde/QXyi/QioiNQrg8YhXIzLX8aUHGWvpS
 ckU8nk3Sy3dwfk8n5wp4FO1Wa2cutGJ5XchxE9lepi1irvE8Wa1pAMCPtTsgqQ6X0Ce6
 Uilw==
X-Gm-Message-State: APjAAAWwbvSlFTq+uMoboN0uYsCqsKRnn1UqxfLAVp8+90UFALzGP8Mo
 3EvNobrmQBO84ZPh0VRTCYH4yA==
X-Google-Smtp-Source: APXvYqyP052MnoCIt9otbEFHJpS8ESKMTcsfW83K3aS+0flKo420kq7/T9BUGd9gxoplW68N5+EqxA==
X-Received: by 2002:a1c:be02:: with SMTP id o2mr6560501wmf.109.1567771538215; 
 Fri, 06 Sep 2019 05:05:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k9sm10356085wrd.7.2019.09.06.05.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 05:05:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE00E1FF87;
 Fri,  6 Sep 2019 13:05:36 +0100 (BST)
References: <20190905113346.2473-1-thuth@redhat.com>
 <20190905140701.6cc679ee@bahia.lan>
 <fc82454c-ee11-c7a3-cccb-eeb51df35897@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, Fam Zheng
 <fam@euphon.net>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, qemu-trivial@nongnu.org
In-reply-to: <fc82454c-ee11-c7a3-cccb-eeb51df35897@redhat.com>
Date: Fri, 06 Sep 2019 13:05:36 +0100
Message-ID: <87blvxzl2n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH] travis.yml: Install libcap-dev for
 testing virito-9p
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2019 12:05:42 -0000


Thomas Huth <thuth@redhat.com> writes:

> On 05/09/2019 14.07, Greg Kurz wrote:
>> On Thu,  5 Sep 2019 13:33:46 +0200
>> Thomas Huth <thuth@redhat.com> wrote:
>>
>>> So far we were not testing virtio-9p in Travis yet, since we forgot to
>>> install libcap-devel. Do it now to get some more test coverage.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>
>> Acked-by: Greg Kurz <groug@kaod.org>
>>
>> and
>>
>> Tested-by: Greg Kurz <groug@kaod.org>
>>
>> Whose tree is this going through BTW ?
>
> According to MAINTAINERS, .travis.yml is taken care of by Alex and Fam,
> so I hope they will pick this patch up. Otherwise, I think it could also
> go via trivial (now on CC: ), since it's just a one-liner.

Sure I'll grab it for the next iteration of testing/next - the queue is
quite full at the moment.


--
Alex Benn=C3=A9e

