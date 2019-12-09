Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieEws-00063v-8q
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2019 04:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ieEwq-00063X-C8
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 04:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ieEwm-0001HQ-Ql
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 04:03:17 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48929
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ieEwm-0001Di-Cw
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 04:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575882195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/asDSglAmIyfbN8hkTgv9Rh4mRXedj8OW4QolP+AcYk=;
 b=PkKtNTnGLV5x3eIS07wp410KT212KYj4+sAdrlu/djvduXBNO5z4Znj8wM7pkBgfQiUk5/
 GRgPFJHdY02GcQNqyCZfFLYQexB/w3w1+gO3L0wonvyab6P82FMqhE8IhOSd1noBVnRRXm
 Ay8ofJE5UkEc1CJgJmpFdTxHEaEaRQA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-CkJObi5DOE6vM2H42abzWA-1; Mon, 09 Dec 2019 04:03:14 -0500
Received: by mail-wm1-f69.google.com with SMTP id q21so3595592wmc.7
 for <qemu-trivial@nongnu.org>; Mon, 09 Dec 2019 01:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/asDSglAmIyfbN8hkTgv9Rh4mRXedj8OW4QolP+AcYk=;
 b=jr6b6FKNm36IqhVuThBFeY61QzdNzuk/edeQOG1wtS/Zvk/n/S+O8DuVjE9kOBvB4v
 Tpq7Cm236DYcIBw+ljO6cKQE36TuFm+1+xqnZ2eFm4T/sOQedQTizMxGLKuBcFZQz5VN
 XJPkMkBh0LF19vgCgbK7dCKV3b4ZGG4aS3eesjKikuK8uX9Q5f5ji6Yfx10xGPFB6TXH
 pjfMJD5guWPN8ACsY+uNwbP9MSEw3MSDB0Dn8p4rBoFXewEIPUOhWuF9Kz8oFaTxA7eg
 zhusShaOacgVEFejJq1TEvjl/hWyjskpv1mA5zgnK8mpUjSQQjCSOFjzOhd/Zt+kiEKe
 q50Q==
X-Gm-Message-State: APjAAAU8coa6JvUj/A0x9bDl3zjqtIqhayXy2+TAvwgntyYfI5mhKu1S
 aIB4vPTq37zQWWTdJo+PGZuxbRGfKygZibxK92HzBndv41nUDkocIq6GyPOnd7ujWwMjgL7O2rq
 ycKNfrSdJ8sKOwFKg0A==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr810311wrm.290.1575882193016; 
 Mon, 09 Dec 2019 01:03:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHeFlhdXgPugxPKICS54R6c2jpDxCB8t7iFOKRWYE2PEJ9+3F/4jpTf2vj7vHbyui0Ln2Gug==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr810286wrm.290.1575882192748; 
 Mon, 09 Dec 2019 01:03:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id x6sm1464669wmi.44.2019.12.09.01.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 01:03:12 -0800 (PST)
Subject: Re: [PATCH] Fix some comment spelling errors.
To: Stefan Weil <sw@weilnetz.de>, Cameron Esfahani <dirty@apple.com>,
 qemu-devel@nongnu.org
Cc: liran.alon@oracle.com, qemu-trivial@nongnu.org
References: <086c197db928384b8697edfa64755e2cb46c8100.1575685843.git.dirty@apple.com>
 <543d4015-f043-96c5-39b8-2a37bd78d689@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a43d589d-5f44-1b21-b6e0-389449bf3739@redhat.com>
Date: Mon, 9 Dec 2019 10:03:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <543d4015-f043-96c5-39b8-2a37bd78d689@weilnetz.de>
Content-Language: en-US
X-MC-Unique: CkJObi5DOE6vM2H42abzWA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Mon, 09 Dec 2019 09:03:21 -0000

On 07/12/19 08:44, Stefan Weil wrote:
> 
> s/compatabile/compatible/
> 
> can perhaps be fixed, too, when merging this commit.

Done, and queued.  Thanks!

Paolo


