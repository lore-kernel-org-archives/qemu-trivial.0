Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVf7S-0008IR-JV
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 13:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVf7Q-0008ES-As
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:43:04 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVf7O-0007bq-LP
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:43:04 -0400
Received: by mail-pg1-x542.google.com with SMTP id q124so71544pgq.13
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2SzaOyDPCGENpZgk3z0k+7YxceN/laQe387Ybrd9snY=;
 b=LrTMMW2E8fTShG3kD6zyyL4vmEI27hKKc0lqlhSd5T0+wP8GEBgE/8CmHBoHXvJtMb
 W0Z21BZbe24AnDm8aqWrvsTtSxhzru+LxvG478uc+oqbSVV9nY5+LNaW6HB4AX9ew19f
 EZ0IFDrPLdf3tRGasiHUvRKcez9w1MFzLO9wvMvZY5I8Ww846UyEA5t9MipDFIT8Mgmi
 +yAmqNT97I2/QKMh4zhUs4LBK4JVUk/cliqvRR3YN/zneXcfvTRXmLO3L9N8YGTs3MQq
 NYmZHSFglK0DFBHP9EjlmoqNkKB9Hi1kKzN/nNMZ6QHyXABY3eoF4xQH/1azSCMeMyt/
 rm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2SzaOyDPCGENpZgk3z0k+7YxceN/laQe387Ybrd9snY=;
 b=EDRYxmrUJlSYT4EnFCS4Mtip+ypAFU44DsZMyX9yjkFhFp6JHnjBn4KN6RCAQJ+FAu
 AnTvP2DsgDwgupVrkquIbrJcfOCCKRpQ/r72NVMq9mFRQX84Zyz2M2902eFWN0o28A63
 rU+xtgUAnSoUi8Q6Euxz1UYE9QMVhWSd2VJiff7AA8rKB3b/gSCWeft1hNQe7fG6Yxv6
 koSvo1cZpmEmxmVC/4eMV/8y3Ezco6a6y9jldTjiQgX7yIP4OujBM0JQQqPEt/5ZnxMy
 rJq7UdZVtZUmmKgKzhiBITkQKkMo/2JTlp3CypOYqKvoe2kCVz//GELWipOWf5nZM/Xe
 pYrg==
X-Gm-Message-State: AGi0PuaoG/xGtKrwAcciRyoezeUWGb7XKdzIAlxyqFf6dJxjHyNYtiH4
 p4JgQo01K+TfyL0uVHETCXdcFw==
X-Google-Smtp-Source: APiQypIWgaLX+awCXvsVRdewO8jmEiF9h4iuEuF8Xj9WFVE//tG7OTutaBIB3VyuU1hc5vM40x1aqw==
X-Received: by 2002:a65:5b84:: with SMTP id i4mr70253pgr.263.1588614181180;
 Mon, 04 May 2020 10:43:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id e5sm9366592pfd.64.2020.05.04.10.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:43:00 -0700 (PDT)
Subject: Re: [PATCH 2/3] io/task: Move 'qom/object.h' header to source
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200504084615.27642-1-f4bug@amsat.org>
 <20200504084615.27642-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <799fe603-906c-c00b-07ce-0e7619c444f5@linaro.org>
Date: Mon, 4 May 2020 10:42:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504084615.27642-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
X-List-Received-Date: Mon, 04 May 2020 17:43:04 -0000

On 5/4/20 1:46 AM, Philippe Mathieu-Daudé wrote:
> We need "qom/object.h" to call object_ref()/object_unref().

This description doesn't seem to match

> +++ b/include/io/task.h
> @@ -21,8 +21,6 @@
>  #ifndef QIO_TASK_H
>  #define QIO_TASK_H
>  
> -#include "qom/object.h"
> -
>  typedef struct QIOTask QIOTask;
>  
>  typedef void (*QIOTaskFunc)(QIOTask *task,
> diff --git a/io/task.c b/io/task.c
> index 1ae7b86488..53c0bed686 100644
> --- a/io/task.c
> +++ b/io/task.c
> @@ -22,6 +22,7 @@
>  #include "io/task.h"
>  #include "qapi/error.h"
>  #include "qemu/thread.h"
> +#include "qom/object.h"

the change.  Since io/task.c includes io/tash.h, what are you actually doing?


r~


