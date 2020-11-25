Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1khywk-0005nn-IJ
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2020 12:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khywf-0005m4-R5
 for qemu-trivial@nongnu.org; Wed, 25 Nov 2020 12:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khywd-0004sS-2B
 for qemu-trivial@nongnu.org; Wed, 25 Nov 2020 12:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606326666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMYL2lSCqVi2UruegtWz5kDARaAjGnaLDBwI8zbfZBU=;
 b=SMg01nvyM5uVCBaZpR90hE4TYTzfkvomrK+/2JKyfdy+JehS3t4eD26PObHltt7AnI77X2
 TBAFSXbMZcsPXUWAjsbBnvSNrI4NpBETSE/MRcNkAQsbGNpmt62eJTlW/Y2JqSvW9Mu38M
 868oJFKD9dqRjV/tmRWdSqx9zG6ZYGE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-wt2yCWY_PNudEcT2cKPkGA-1; Wed, 25 Nov 2020 12:51:04 -0500
X-MC-Unique: wt2yCWY_PNudEcT2cKPkGA-1
Received: by mail-ej1-f69.google.com with SMTP id y10so1051930ejg.3
 for <qemu-trivial@nongnu.org>; Wed, 25 Nov 2020 09:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RMYL2lSCqVi2UruegtWz5kDARaAjGnaLDBwI8zbfZBU=;
 b=JGtevoyN6CagVhJn7a9UopVzsAEorcTskK+5NomPYhaDt/OYYp48sWKYposqamD7mT
 /Q/FTi3pWdAo5CHFXpDIuE2uC424ZGnALx2bhxiS6G/Ey6QysDc24FBHPMWaYGxzX8iI
 zbcAiwiyPpsIdtoUyQ/LWhTl5x62/A25XxKr6nAp3CHRH2IfcSJlkjiRpdgw0ZjC7l/C
 n9mNwVGEYl3brULgMefuuH1irGsXRNxXU+j4nHJSqHhKzNZqzByDdllfHnOCxQPYGbvY
 2bxui7MGMfsPR4TSPeIl6cdzSKu38vRsoarMlKYBiO/PosaxxafAdHqhFJUU9MiHoqZT
 PxpA==
X-Gm-Message-State: AOAM531XZyIBcAZRdmStfHm9QGJ0l2v0cEsdvBabfWRXaVFqhpXKJAJ5
 HYmq0CiJsPgbTiQe20lmK5/WbOVC+2nJAFZPvSL7JY+i1Bxcrj2yaJ+A9slCc/vSiu4j6qXXAtc
 ahO13lO+JCdIBtAb3zg==
X-Received: by 2002:a17:906:dbd6:: with SMTP id
 yc22mr4223887ejb.252.1606326663271; 
 Wed, 25 Nov 2020 09:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJXt5BCbUD2+PbbNVOcncYRGn48YSuOsYWfS7zMcf4Ph6wy2h7SJKiizzzzozPlha9Dl7uRw==
X-Received: by 2002:a17:906:dbd6:: with SMTP id
 yc22mr4223865ejb.252.1606326662979; 
 Wed, 25 Nov 2020 09:51:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u18sm1707312edd.60.2020.11.25.09.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 09:51:02 -0800 (PST)
Subject: Re: [PATCH v1] configure: remove python pkg_resources check
To: Thomas Huth <thuth@redhat.com>, Olaf Hering <olaf@aepfle.de>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201124211925.4194-1-olaf@aepfle.de>
 <055163a8-9c26-4454-89e8-9b40c31d79a0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <15bc839d-5022-d047-7f6b-dbc9d5961f27@redhat.com>
Date: Wed, 25 Nov 2020 18:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <055163a8-9c26-4454-89e8-9b40c31d79a0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Nov 2020 17:51:10 -0000

On 25/11/20 05:19, Thomas Huth wrote:
> On 24/11/2020 22.19, Olaf Hering wrote:
>> Since meson.git#0240d760c7699a059cc89e584363c6431cdd2b61 setuptools is not required anymore.
> 
> That commit was part of meson 0.55.1. We require at least meson 0.55.3. So
> right, this should be fine.
> 
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> ---
>>   configure | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 8c5d2f9a69..ce9b3c0a33 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1913,9 +1913,6 @@ fi
>>   
>>   case "$meson" in
>>       git | internal)
>> -        if ! $python -c 'import pkg_resources' > /dev/null 2>&1; then
>> -            error_exit "Python setuptools not found"
>> -        fi
>>           meson="$python ${source_path}/meson/meson.py"
>>           ;;
>>       *) meson=$(command -v "$meson") ;;
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I guess we could now also remove the corresponding package from the docker
> and vm files?
> 
> $ grep -r setuptool tests/
> tests/docker/dockerfiles/debian10.docker:     python3-setuptools \
> tests/docker/dockerfiles/fedora-win32-cross.docker:    python3-setuptools \
> tests/docker/dockerfiles/fedora-win64-cross.docker:    python3-setuptools \
> tests/vm/freebsd:        "py37-setuptools",
> tests/vm/openbsd:        "py3-setuptools",
> tests/vm/haiku.x86_64:        "setuptools_python3"
> tests/vm/netbsd:        "py37-setuptools",
> 

Yes, it should.  I sent a patch for this.

Paolo


