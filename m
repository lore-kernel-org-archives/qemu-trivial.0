Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfhhF-0001ey-Jf
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 06:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfhhD-0001bh-2t
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 06:29:31 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfhhB-0001Z7-Cn
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 06:29:30 -0400
Received: by mail-wr1-x442.google.com with SMTP id y17so10900789wrn.11
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=mLkfz/YrugHPHOMu6u+ikmgFpMqWiCRAofB3gGvkuNw=;
 b=e73CoYSZbhv9t7+T7ytNT9KHNgHBZRU6EW4TeUxBZTU9BRKXIBDZiMDgGJQc7Nmk/A
 9AsMziaxTG4yGG79U4hrEi/+h63ZUY7Qi/RBpVH6LH+1hevD+ze5oIOKQri4l9X7EkWt
 Ou7IqL8iYI0Sg/+iBIo+nY9B/QSec3R9sEVz7Ypov+ILU0oePDA/mh/6K4ZGi6gPEcBd
 JyrddO6MPqYcBEpwzkdbAh5H5kq1zu0DyheYERUyylujHM6gjroBbuAo/Ei/fd6wh3t9
 2LaLVlGx53+GajcFvKOL1O729Ueid9ohuPfix77ck3si+7I+ohfRbLy/P5X/G3Q11ExP
 Pi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=mLkfz/YrugHPHOMu6u+ikmgFpMqWiCRAofB3gGvkuNw=;
 b=iDsbKZtar2lizfT7c7b/lru7kHD+R0xyIl44K1LYW7eXMphf6wDpO4kmpUKqxXnKZe
 yGON7V5Z4W2oRDPm98ntXdVkl/tv1itST7aJTeNK0KXcd664Z9bwI21NLm5ci9fsiOwJ
 a/TyfUFO2dW6xG7pa8GkMZQ8QBrdOp883989QqNa+uTJEFhek9s7vU1KzCtw80KtS6UG
 GqDmvc8oAX08Xnz8DCLoRVNbpg63GXImn6OAflMMWIHn8I7VQNmhDWP8mmXr59kOXg0B
 8ft7AlyQGza2ASejOR6mY083PO3IAd8ck0qv5HITdhMyiwG9cMjR+LFpJcNUOhAb6JJx
 DAMg==
X-Gm-Message-State: AOAM532iH8lEW1plGWD/TYmDqTMaIyjNrM06zHneaYhutHuz7bkRI3N5
 aeTHj5fRv8DVu66D+CaEA9e/HQ==
X-Google-Smtp-Source: ABdhPJwy8s1bH2ZE//NGP2m4WwTzFcWIDGRoUOSbPNF0JwfmpxW3dgteR9f16O4XqwuVe7dhQUteKQ==
X-Received: by 2002:adf:ab44:: with SMTP id r4mr20759104wrc.261.1591007367779; 
 Mon, 01 Jun 2020 03:29:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm12998252wmg.38.2020.06.01.03.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 03:29:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F58E1FF7E;
 Mon,  1 Jun 2020 11:29:26 +0100 (BST)
References: <1589806958-23511-1-git-send-email-frederic.konrad@adacore.com>
 <5ab6f370-6725-1cdb-1b82-24a58cb7642e@redhat.com>
 <dfd77414-83e8-755f-1386-13188b968aef@adacore.com>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fred Konrad <konrad@adacore.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 frederic.konrad@adacore.com,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] semihosting: remove the pthread include which seems unused
In-reply-to: <dfd77414-83e8-755f-1386-13188b968aef@adacore.com>
Date: Mon, 01 Jun 2020 11:29:26 +0100
Message-ID: <87wo4r6pvd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
X-List-Received-Date: Mon, 01 Jun 2020 10:29:31 -0000


Fred Konrad <konrad@adacore.com> writes:

> Le 5/18/20 =C3=A0 3:50 PM, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
>> On 5/18/20 3:02 PM, konrad@adacore.com wrote:
>>> From: KONRAD Frederic <frederic.konrad@adacore.com>
>>>
>>> This have been introduced by:
>>>    8de702cb677c8381fb702cae252d6b69aa4c653b
>>>
>>> It doesn't seem to be used so remove it.
>>>
>>> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
>>> ---
>>>   hw/semihosting/console.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
>>> index 6346bd7..22e7827 100644
>>> --- a/hw/semihosting/console.c
>>> +++ b/hw/semihosting/console.c
>>> @@ -23,7 +23,6 @@
>>>   #include "exec/exec-all.h"
>>>   #include "qemu/log.h"
>>>   #include "chardev/char.h"
>>> -#include <pthread.h>
>>>   #include "chardev/char-fe.h"
>>>   #include "sysemu/sysemu.h"
>>>   #include "qemu/main-loop.h"
>>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>=20
>
> Thanks for the review, Philippe.  Can this go through qemu-trivial?

Sure:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

