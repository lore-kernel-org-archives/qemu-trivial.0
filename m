Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVf5B-00050J-QX
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 13:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVf59-0004y8-By
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:40:43 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVf58-0005Z1-Ev
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:40:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id r4so103495pgg.4
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pIm66RInHb+qZxnnCyf3TXTDG9MbmDn+wmNd/nOa+bI=;
 b=JOYc0zXcBxawgrB/+nxfnanoYg2M5U6+/8n/gcn6aRe8AJE0Ih8qmgxoXW5FzMlAw7
 CZFDLfjC+zZTiIpkG+mf0OnWAKfTmzKCUYLRS5UC4e0PZpl7qkDhsSdM7XXu/5S1inMD
 c/Aeg2Ra0mJHJ/SDqjWfGWMahPeBSAPVA7vqO18+3ww/xiryQz12x/JY9rrbEtXCGYT0
 4VmrMLov7NLA/7GZ1d2xYg3yTUMNorOGN+JQ1zVPUMb+r230K3uyVK1xhsGImMedPlAT
 QmBh2XEnKgyA3HecIRcSXVgIbyUsrnnfJTTrx/C3sRPB0ByYiLWGWC35wEDJwcaOSkmJ
 85vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pIm66RInHb+qZxnnCyf3TXTDG9MbmDn+wmNd/nOa+bI=;
 b=bKQkRF9izCY8j1cIFjoPkJwH7f++BBMaSyLQevaIQO0tjljxCVenGISCPqRbSLZKeW
 KdsZ6E0qEdWlS2rg2LAZ95jCfAtddWm8jkv7DS7o5utTdV3XftICssb6ykk7VFqL9iYf
 4fqIxctPcz6a8X7kqDA6rDVDfPuqMpr5Bhq+hmRpMnSOdqacVUbUU3AHrLbesmnd5gLX
 X1St5veCZH166FL2k76Lku3dhNUWkCmsGf39BowUzJe3HWrGZlAQf0ktpEbSdhfkwmjb
 JVvd3WQ+k2fjP1MmIL/T7GhOOIppi1kHu9RzwJvOsAM9ssdVug8nlSmif5QT1Me37rxw
 PfhQ==
X-Gm-Message-State: AGi0PubT2b2xO+b2d8zYcnTUUlt++Occ52r4nvj7deT02Dg/lBllEiWN
 aNJEs6dq92eLh4pKO4z+hM1Fbg==
X-Google-Smtp-Source: APiQypLSAWhC3Lz0WodJzRzAeX//re/UrzJPYMhhAG/morl7zPBHmuYRi/e+0mr7GCHRxzsph+OC/w==
X-Received: by 2002:aa7:9ae5:: with SMTP id y5mr18366187pfp.294.1588614039027; 
 Mon, 04 May 2020 10:40:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b73sm9379658pfb.52.2020.05.04.10.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:40:38 -0700 (PDT)
Subject: Re: [PATCH 1/3] qom/object: Move Object typedef to 'qemu/typedefs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200504084615.27642-1-f4bug@amsat.org>
 <20200504084615.27642-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2da9461-b762-1757-3df3-e30a801b75bd@linaro.org>
Date: Mon, 4 May 2020 10:40:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504084615.27642-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 17:40:43 -0000

On 5/4/20 1:46 AM, Philippe Mathieu-Daudé wrote:
> We use the Object type all over the place.
> Forward declare it in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/qemu/typedefs.h   | 1 +
>  include/qom/object.h      | 2 --
>  include/qom/qom-qobject.h | 2 --
>  include/sysemu/sysemu.h   | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


