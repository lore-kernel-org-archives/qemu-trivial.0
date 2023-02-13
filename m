Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRZkq-0005Q3-6C
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2023 09:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRZkn-0005IC-VY
 for qemu-trivial@nongnu.org; Mon, 13 Feb 2023 09:24:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRZkk-0001wZ-PC
 for qemu-trivial@nongnu.org; Mon, 13 Feb 2023 09:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676298256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSXH+UT/ENijXW1AQ5vXTQqj3NZWL0J+vOdgeUpC0yo=;
 b=amMruWg89MiGexl9kEU30kjkmmwDmFgPB8N6CXIqjd8QBDLYV0zlDe0c8Qlbpyb7IRT+o/
 FvRoc38Oj9VPAVndVunGmhlmA2AZXPV/JTlI9KPVW0Pd91V6t4h5hX/bCU5dkuBnAEu/oR
 SXz3+u8VWvSvQerM1sRNO2v/3kW21yY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-Ghw3J0ifP7OQsRuYTFiHHg-1; Mon, 13 Feb 2023 09:24:15 -0500
X-MC-Unique: Ghw3J0ifP7OQsRuYTFiHHg-1
Received: by mail-qk1-f197.google.com with SMTP id
 130-20020a370588000000b0072fcbe20069so7611070qkf.22
 for <qemu-trivial@nongnu.org>; Mon, 13 Feb 2023 06:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QSXH+UT/ENijXW1AQ5vXTQqj3NZWL0J+vOdgeUpC0yo=;
 b=7wI1f3Hr2BxG6yN9qH0neFETJvQDgVjqR4fTJmetftgh5B0gJ0v/EyjdNRk3brBZ83
 n51VT1YgZYHqNiODVmvMY9wBY+gULRvMV1b3HU/0aCYIDmKgf0kbn5+T4ZoxCf3yC1nK
 fPuX1VJwD92AjhDbo7MRxbNyZsjIgQY3/Q6CIOJb5q0N6QY0W9GSsOllgIYj5xpH26kA
 vLh3MFha4Bahs4kK/txNWFBLpQqKu1C/d2UQq6IQQAXUoBvrHAZsaKx8uQtDaJHcano+
 3EQ6MfnrQDQa3DtpGnXn8Voz/hW1G0nQMQRgwle3PVY4PLirpeUd7DJS6SOCa80pcVxq
 6vQQ==
X-Gm-Message-State: AO0yUKX+y8Z4xRC+5vnzlqETiJeIh3XmzX5RJDDfBLRSeWRa7F6w2P2z
 iDxCg92+ZnSSypFwSMQA0iJjmin+qhB7qEF+tJYigwbt8yxDq2v8SGwtiEh/N/XCRCV+kDR9Nyz
 9kuDIXs9FHCnHSaaPuQ==
X-Received: by 2002:ac8:5850:0:b0:3b6:3494:174 with SMTP id
 h16-20020ac85850000000b003b634940174mr46356543qth.52.1676298255003; 
 Mon, 13 Feb 2023 06:24:15 -0800 (PST)
X-Google-Smtp-Source: AK7set84s2VwveEBTXY8OemH9zgPdvqomnh+13LzXTcwZQCc1LMszZVSUfG/TUjyJ+Zfm9/wwYlkHQ==
X-Received: by 2002:ac8:5850:0:b0:3b6:3494:174 with SMTP id
 h16-20020ac85850000000b003b634940174mr46356511qth.52.1676298254773; 
 Mon, 13 Feb 2023 06:24:14 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 r6-20020ae9dd06000000b0071d7ade87afsm9680329qkf.67.2023.02.13.06.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:24:13 -0800 (PST)
Message-ID: <383a2e03-7ee9-cc93-72d5-7f039314f932@redhat.com>
Date: Mon, 13 Feb 2023 15:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] Do not include "qemu/error-report.h" in headers that
 do not need it
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230210111931.1115489-1-thuth@redhat.com>
 <87zg9lpre8.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87zg9lpre8.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 13 Feb 2023 14:24:26 -0000

On 10/02/2023 14.43, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Include it in the .c files instead that use the error reporting
>> functions.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   RFC since it's more lines of code - but I think it's still cleaner
>>   this way.
> 
> Yes, please!
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

FWIW, I just noticed (thanks to the gitlab CI) that I was missing two more 
hunks:

diff --git a/ui/dbus-console.c b/ui/dbus-console.c
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -22,6 +22,7 @@
   * THE SOFTWARE.
   */
  #include "qemu/osdep.h"
+#include "qemu/error-report.h"
  #include "qapi/error.h"
  #include "ui/input.h"
  #include "ui/kbd-state.h"
diff --git a/ui/gtk.c b/ui/gtk.c
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -36,6 +36,7 @@
  #include "qapi/qapi-commands-machine.h"
  #include "qapi/qapi-commands-misc.h"
  #include "qemu/cutils.h"
+#include "qemu/error-report.h"
  #include "qemu/main-loop.h"

  #include "ui/console.h"

  Thomas


