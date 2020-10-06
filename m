Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPr1K-00044w-HK
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 13:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPr1I-00042I-Eu
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 13:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPr1F-0000Ku-UE
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 13:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602006297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/j0izEwkRMqaYR3cmrmvMisLv+r2OAg54P/ktyXwRL0=;
 b=VIdRwGAmKPab0Xp9RaHJhEpdvj1RPTsqwjijhqX7osRklVJHTHa4Y0i0zy8kGsk5YWXUYa
 scF3AwDmPm+0R65Jp7bMZTlqaoUg7qTOCI1P88IUDcuU+cRmHTxxj+u0sg53YKJJ0sFKeR
 QnSEtzlkbpaNfpsomfYtLkRrNjYX0Mk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-jlLF9MXRNvGCw4XvT6Jg5g-1; Tue, 06 Oct 2020 13:44:55 -0400
X-MC-Unique: jlLF9MXRNvGCw4XvT6Jg5g-1
Received: by mail-wr1-f71.google.com with SMTP id d9so5633573wrv.16
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 10:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/j0izEwkRMqaYR3cmrmvMisLv+r2OAg54P/ktyXwRL0=;
 b=mjJHsEpmtIKd/0OnMS30fiRV6z2A3EZV34wOQJgbt/qvNL7Qlh7ESzz79jZvD0rVnb
 QvJ/ee41hmHleTRduAQXQxxXt5u0Tq5aqDMeTQAlyDCPZN166pUj1NyM/VwWnJ5CF5Rm
 NJNBII20PvkAoxx82wVqIsOqG9PxltjZkpc6+ICMRTj52gquvc+8IkPEvQYbwQlu3gu4
 W1RsCOg0THwe0npa6JwSNw6zBIKhKHNKx/70cD/hwJJQM62W27h1hp7wl7BKGL+/duEp
 4pEY2nBX/9oCGYk4u9TTdqV7mfWkk8LVc56DDA1Zv4+xhSydLVbOYkFIpEH7hCRMe6ft
 L+cg==
X-Gm-Message-State: AOAM530Wixz3XwwmDcq5VXSOOW/PJBSoJfjxLuemRC9OtQGH3E4QRSVH
 22G5a3VpBZhu9BCF7BdompIFV1DRSMDyE3Yi+eR5TiOorlGOy49t0hnRFFTIVMW6Lx4Xo/S7SqH
 ieyUfu/xfKPf0riLswg==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr4165342wml.23.1602006294119; 
 Tue, 06 Oct 2020 10:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb8rMSzFHnzbebH0XoFQkFSn2yUKyVlcRkY6YTCq5E/tKmdeogVqS1qdwWqSudwI81ekOs+w==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr4165326wml.23.1602006293923; 
 Tue, 06 Oct 2020 10:44:53 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j101sm6254782wrj.9.2020.10.06.10.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 10:44:53 -0700 (PDT)
Subject: Re: [PATCH] tests/docker: Add genisoimage to the docker file
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org
References: <20201006174347.152040-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a9e55b3e-4f15-fdd2-2836-c88e6d505a30@redhat.com>
Date: Tue, 6 Oct 2020 19:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006174347.152040-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 06 Oct 2020 17:45:00 -0000

On 10/6/20 7:43 PM, Thomas Huth wrote:
> genisoimage is needed for running the tests/qtest/cdrom-test qtest.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/dockerfiles/centos8.docker      | 1 +
>  tests/docker/dockerfiles/debian-amd64.docker | 1 +
>  tests/docker/dockerfiles/fedora.docker       | 1 +
>  tests/docker/dockerfiles/ubuntu2004.docker   | 1 +
>  4 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


