Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbO5E-0004a5-0T
	for mharc-qemu-trivial@gnu.org; Fri, 15 Oct 2021 10:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO5B-0004Wz-Dv
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 10:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO55-0006ym-Ro
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 10:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634307666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O85AhZJWgHRAT0WucQBWTJ+8VTYTNpgyZoNXnMl20eM=;
 b=XRxweBupHtgymQ5IT4GeMPdoQ7vomSJQh6ppWPDbI3IvVXRfLN4lmb2/o94G79m1dJIFrS
 sPWCX7YEUiAJiCGI+BLq0ntOekb6aUdH4k3nfCB2RQIcHo0JZjm4NawhJkVPm8Q5Fvron0
 VkHZWz5V4TqnSPzNO9PawqJ5hNTkf/Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-BHzR857COTeJzVUzkzJYWw-1; Fri, 15 Oct 2021 10:21:04 -0400
X-MC-Unique: BHzR857COTeJzVUzkzJYWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p12-20020a05600c204c00b0030da46b76daso934417wmg.9
 for <qemu-trivial@nongnu.org>; Fri, 15 Oct 2021 07:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O85AhZJWgHRAT0WucQBWTJ+8VTYTNpgyZoNXnMl20eM=;
 b=l056cFJDXtL1nCCcWJNnS4ZqbS8B+r1WsBetDTsI7wDj3fn0aMr98h/a/Q8gzuW1Tw
 6gxGMwUtik4tYLtu3lN5GCk1ek8+whQ11FY7BAQFTA6eKEoEtGs7L2N3PP96ohx+nrQt
 GIH4BxVyj5011LBvB5JyBoSHQ7/kwxCjiDh92e5OES0LSJrHzEzYg6MzjJI5FGb/VnpB
 6sHYx9uTUPYGSYPUjLWaSqfQ6inHlmiWDgWq4jNLS5aTkXsC6rdbF7Z7uB58K9lYRxYx
 sjQEnE5mOAs4080qamTRbY2oanNAAToN5buuTdF8Mige/sGcC2tzQanQK6OirhlsLHhm
 t0jw==
X-Gm-Message-State: AOAM533L0T1FQ+MmW0iEKsnwAZyUY43eNNWfeCfH4IS8Ok3FB4XXdQVr
 xBAoEu8qd4oXfUIlH2JUY8xHYeWN7izIX71XVQXvcGjSSMPIkL2fD7WfNlWI0y/w5hN9QwwG4QU
 iomsY7KD3gsAPu7+EqQ==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr14695477wru.14.1634307663594; 
 Fri, 15 Oct 2021 07:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ5bOdavsCWI2mqFQXFnYVMjXgit8JvvmvCXER23YUqkZbMchXF+oOJTVqU9TVvvtABfTxpA==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr14695419wru.14.1634307663233; 
 Fri, 15 Oct 2021 07:21:03 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id r205sm4887725wma.3.2021.10.15.07.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 07:21:02 -0700 (PDT)
Message-ID: <25f4a871-36b7-dc14-929b-54e7d568f3be@redhat.com>
Date: Fri, 15 Oct 2021 16:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] analyze-migration.py: fix extract contents ('-x')
 errors
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Cleber Rosa <crosa@redhat.com>
References: <20211015131645.501281-1-lvivier@redhat.com>
 <20211015131645.501281-3-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015131645.501281-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 14:21:14 -0000

On 10/15/21 15:16, Laurent Vivier wrote:
> When we try to use 'analyze-migration.py -x' with python3,
> we have the following errors:
> 
>   Traceback (most recent call last):
>     File "scripts/analyze-migration.py", line 593, in <module>
>       f.write(jsonenc.encode(dump.vmsd_desc))
>   TypeError: a bytes-like object is required, not 'str'
> 
>   Traceback (most recent call last):
>     File "scripts/analyze-migration.py", line 601, in <module>
>       f.write(jsonenc.encode(dict))
>   TypeError: a bytes-like object is required, not 'str'
> 
> This happens because the file 'f' is open in binary mode while
> jsonenc.encode() returns a string.
> 
> The results are human-readable files, 'desc.json' and 'state.json',
> so there is no reason to use the binary mode.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/analyze-migration.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


