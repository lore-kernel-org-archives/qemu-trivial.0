Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFwNL-0002BP-Ui
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2023 07:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFwMV-0001zZ-Jj
 for qemu-trivial@nongnu.org; Thu, 12 Jan 2023 07:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFwMT-0004Nm-TN
 for qemu-trivial@nongnu.org; Thu, 12 Jan 2023 07:07:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673525232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUNTn16WWKNCTBIRDDsf5KF17X/QkYHgUuF2R/ZJjTo=;
 b=FvrIk8d+zuU85qIrRd8aqCIC6UkUWYeM0iRNNp66fAwzq7B1VwnX8MekvSYRWnF0Fjvegc
 tuF4zVxRukIo2OGkezVRA+9GPUnLPSUBS1EYDaqenMEt67tlDja0fi8ZiPvaneZ38ZYP+p
 xwzAiMHvrlL6MPX1xDzhSBA5jyPxUDo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-T0aQWCNmMySlXtOlzf02TQ-1; Thu, 12 Jan 2023 07:07:11 -0500
X-MC-Unique: T0aQWCNmMySlXtOlzf02TQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l17-20020a05600c1d1100b003d9a145366cso9178731wms.4
 for <qemu-trivial@nongnu.org>; Thu, 12 Jan 2023 04:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUNTn16WWKNCTBIRDDsf5KF17X/QkYHgUuF2R/ZJjTo=;
 b=AOgiySArHxI4MSh7mFtcEKw3B7kvlIWhIrlhh8DGEdvN6N7x7mS9eVGziZTeSkg2y4
 2m69/XrPU1nC3IaSNnwJTJmNbuPKAQ2SA15wpAS2pMh6zJxvQTODMjX/OmyYFA9NY8Zu
 f3b/9q22xx9fQHeIb/QKC8C12KY8jtQ4S5u1A/Kp2jIgede0pK7cNFZ3IlqLScq31wl1
 To3fYkbDJVOxRkP2Q5RK81q8z2fKwHlcOOv1wOPTaRTNaAcqyXqTZtd8xDL1loFdNs77
 GgyF/U/BEYk/UpMqR09xB0bFTCQGpB82crdwDy+BQ48685HnpMVd+Dn+YHCQxrsjbdJi
 uQyw==
X-Gm-Message-State: AFqh2koVG7Ohj+P4AtMgIiRx+Lgp0gAei+I5Pkxwgi+uwpJLjjdmoogi
 NkEoGw12IgZ7JRLH9U+bCv0863tEIX2b/cv8MYchoPYq88ZpJ4scOgpzRzuoPYMUsu0+KNu30y4
 nW0CkjyzomET+8SDx8Q==
X-Received: by 2002:adf:e74e:0:b0:242:2755:211a with SMTP id
 c14-20020adfe74e000000b002422755211amr48440849wrn.38.1673525230519; 
 Thu, 12 Jan 2023 04:07:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+Rr//biOxR47qtYBeu2Ylq/WjTRLMjDLjUZY5Bk3BHuZtFffL0e+3534+nY3nOgE6Mo5vFw==
X-Received: by 2002:adf:e74e:0:b0:242:2755:211a with SMTP id
 c14-20020adfe74e000000b002422755211amr48440834wrn.38.1673525230242; 
 Thu, 12 Jan 2023 04:07:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm19163322wrx.72.2023.01.12.04.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:07:09 -0800 (PST)
Message-ID: <d8848620-9882-a457-903b-2f600fd09b7c@redhat.com>
Date: Thu, 12 Jan 2023 13:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] scripts/archive-source: Use GNU tar on Darwin
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221209113342.61053-1-philmd@linaro.org>
 <9425e026-e19c-d648-d8e3-71563c686464@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9425e026-e19c-d648-d8e3-71563c686464@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2023 12:07:43 -0000
X-List-Received-Date: Thu, 12 Jan 2023 12:07:43 -0000

On 12/01/2023 12.58, Philippe Mathieu-Daudé wrote:
> ping?

Who's supposed to take this?

> On 9/12/22 12:33, Philippe Mathieu-Daudé wrote:
>> When using the archive-source.sh script on Darwin we get:
>>
>>    tar: Option --concatenate is not supported
>>    Usage:
>>      List:    tar -tf <archive-filename>
>>      Extract: tar -xf <archive-filename>
>>      Create:  tar -cf <archive-filename> [filenames...]
>>      Help:    tar --help
>>
>> 'tar' default to the BSD implementation:
>>
>>    $ tar --version
>>    bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.8
>>
>> Try to use the GNU implementation if it is available (from homebrew).
>>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> Supersedes: <20221208162051.29509-1-philmd@linaro.org>
>> ---
>>   scripts/archive-source.sh | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
>> index 23e042dacd..e3d0c23fe5 100755
>> --- a/scripts/archive-source.sh
>> +++ b/scripts/archive-source.sh
>> @@ -18,6 +18,7 @@ if test $# -lt 1; then
>>       error "Usage: $0 <output tarball>"
>>   fi
>> +test $(uname -s) = "Darwin" && tar=gtar || tar=tar

I wonder whether this script works on other *BSDs ... maybe it would be 
better to test "tar --version | grep -q GNU" to make this even work on 
non-Darwin systems where "tar" is not GNU's tar?

  Thomas


>>   tar_file=$(realpath "$1")
>>   sub_tdir=$(mktemp -d "${tar_file%.tar}.sub.XXXXXXXX")
>>   sub_file="${sub_tdir}/submodule.tar"
>> @@ -67,7 +68,7 @@ for sm in $submodules; do
>>       esac
>>       (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > 
>> "$sub_file"
>>       test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
>> -    tar --concatenate --file "$tar_file" "$sub_file"
>> +    $tar --concatenate --file "$tar_file" "$sub_file"
>>       test $? -ne 0 && error "failed append submodule $sm to $tar_file"
>>   done
>>   exit 0
> 


