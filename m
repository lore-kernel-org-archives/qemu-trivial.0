Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJhjH-0006KT-M6
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 14:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJhjE-0006Is-7B
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 14:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJhjA-0001IU-E4
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 14:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615316947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t74XzBLrYMwzv4lixFZUSxbdgtyNB1o0grdw2prjhrw=;
 b=A1ZbdShKAvkGhFt2nkpBB/M0nzC7Zz9OQmGr0uPmyAAW5Ad7sgiPJvC29W+Nmr8ui9f7Pw
 p8O4Kz7TT56M7E9xn3+l06n+NBIrYNIvQhO7c/v4EvTZU4X7mA+ROhvq6QqpD4dusloQqc
 WjE1Dsza5+i6NNAIjDH36ryAbYSPg0Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-GCye12p0MeGo4VmDknvYGw-1; Tue, 09 Mar 2021 14:09:05 -0500
X-MC-Unique: GCye12p0MeGo4VmDknvYGw-1
Received: by mail-ej1-f72.google.com with SMTP id di5so6094617ejc.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Mar 2021 11:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t74XzBLrYMwzv4lixFZUSxbdgtyNB1o0grdw2prjhrw=;
 b=nzOFjkXGEZdgczzFIGRvdf+dfMmsrWRjYcdeapUm8l65q17C2ucM6YqFzdwIuNjago
 hoT7swm+AddyCVT6Lrpj+w7iqa2yXs6H/5DItrWH9uzIU29B36aBwQP7t5X6DcoTSePB
 eMVF4XDSN+gfTuZjD+UmUVrdZKJY7D+Ti9RJNmDUeXh6pqCK5IKJXk8tsRmeqIID+LhQ
 veHsqjM/PAFvzWnsSjxc4iclBaB25T0tkpMP5cNp4D54qqckSHgbTbElFF1CLuCJ8cgl
 5IBVnkujNt7NLQez04EqEiyqLwFVU/SF/LSJ+Qcg/LL40Yd0XVefIvbMDYQKGvpwPiGZ
 CuhQ==
X-Gm-Message-State: AOAM532PIgJzH+7f/e81h0km3kL1nuWxXeXZhgcf9MM2m6MMlLQlRR7B
 upq4aBo/R3TvTGxs4HeiLYJNQDJP2jIUwtTQzxeHSsvtoXa2H88gVE6llrN+x0QzNusRAKg0Qvb
 5xll55YPN6ATA+Bz1aIrbW/f4DgDm/hvuZyDMq2yshOYT7TejnDw6776tra3vUxJ029E=
X-Received: by 2002:a17:906:9be1:: with SMTP id
 de33mr23149722ejc.320.1615316944066; 
 Tue, 09 Mar 2021 11:09:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPKCVgHsfydOWIHUJnYNtTg+ao6Ia2wPd/fiHPvX7GZAy3Saa3QS5h7XVTF4XCNMMPHt0Njw==
X-Received: by 2002:a17:906:9be1:: with SMTP id
 de33mr23149702ejc.320.1615316943882; 
 Tue, 09 Mar 2021 11:09:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m7sm8754097ejk.52.2021.03.09.11.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 11:09:03 -0800 (PST)
Subject: Re: [PATCH] qemu-common.h: Update copyright string to 2021
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210309162258.28633-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ca695b1-a341-6ff0-6b45-e929a7fd83d9@redhat.com>
Date: Tue, 9 Mar 2021 20:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309162258.28633-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
X-List-Received-Date: Tue, 09 Mar 2021 19:09:13 -0000

On 3/9/21 5:22 PM, Peter Maydell wrote:
> Update the common copyright string that we use in
> -version reports, About dialogs, etc, to 2021.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


