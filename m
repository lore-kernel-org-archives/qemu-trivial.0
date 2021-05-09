Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfc0b-0006zM-0K
	for mharc-qemu-trivial@gnu.org; Sun, 09 May 2021 01:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfc0Y-0006ys-Jj
 for qemu-trivial@nongnu.org; Sun, 09 May 2021 01:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfc0V-0006o1-HG
 for qemu-trivial@nongnu.org; Sun, 09 May 2021 01:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620538173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LC6H4sxOezwFjICMSVGaNd10Utf5FoDBZj2oRvb2dkE=;
 b=hnQFv1oQELrYnD62jdI6zfQ3fqLcd4Oi/mIG6ssEaULHzKzt/5JEuqPZjZ/gHQAcVOl6LH
 i1bv4LdnVQce8YIAeLsHk4rlT2QF7dhoW5eeMAbTgeoADLNzCt4xd7Ut0fwDRfGtxU0B5i
 Gr62TR5JzSIgW6fLQTsKGLLX2nHQ+Uc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-QFBgS3gTOF6eTBIuRTGIbQ-1; Sun, 09 May 2021 01:29:31 -0400
X-MC-Unique: QFBgS3gTOF6eTBIuRTGIbQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso5678847wml.6
 for <qemu-trivial@nongnu.org>; Sat, 08 May 2021 22:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LC6H4sxOezwFjICMSVGaNd10Utf5FoDBZj2oRvb2dkE=;
 b=n79MI/7zB7CvfAvchwnR6lmfnTOBIasK9iR6XQASGDBg59xajOC6oyY3r8hWRHadML
 /1g2SinMXPY+mll2rE6wn4rrQVEZuoiUxTJD3174OcCshFAa79vCr5C+pUK/iNKjbPrg
 pQ9jv7gq7SdnHbP69haL/plRNVugOoWJgFoKkCaFkHC5TeUDLJTmQxcdLzHfiPxQMdZ8
 OyrEOFBeNTt2nhEQV6ChqwwOWgoWXe4hNRcg4q8YWzeyRV4CzpkCLn3ATGivmV6jnnm+
 GUWTYwDA94UwHhKNxU+/SCXvaCofv+OUNp67JdfjWzpoikWVQ+ILsab5DMOLB7BAw8wM
 cvqQ==
X-Gm-Message-State: AOAM531KcYnpEy0wV0Fn8Ibs+X4hwVoZg+PMkGOTWe3eQ7U2Q2hzG1vg
 IwnfjfHxMOfUWizQP+nLOp1dSodO9gWAD+ArOVHbJIB5ik594hCaq9C96r8YTuIhUJvBEKsAk2s
 ACfCvKZjLhmAau3Mmgg==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr22589036wrr.88.1620538170286; 
 Sat, 08 May 2021 22:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAmSy1FQXPRfEjqMyxZl5oeHfYc+wMCQ34bJOZrbNHBPk6wZr4Or2igO1kA66krS0CYpjBgw==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr22589029wrr.88.1620538170138; 
 Sat, 08 May 2021 22:29:30 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id e38sm19654320wmp.21.2021.05.08.22.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 22:29:29 -0700 (PDT)
Subject: Re: [PATCH trivial] hw/gpio/aspeed: spelling fix (addtional)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, rashmica.g@gmail.com
References: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87f7c83d-ce4d-a1fd-66d2-cf98ee525f73@redhat.com>
Date: Sun, 9 May 2021 07:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Sun, 09 May 2021 05:29:39 -0000

On 5/8/21 11:36 AM, Michael Tokarev wrote:
> Fixes: 36d737ee82b2972167e97901c5271ba3f904ba71
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/gpio/aspeed_gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


