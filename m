Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kw34A-0003hp-8L
	for mharc-qemu-trivial@gnu.org; Sun, 03 Jan 2021 08:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw349-0003hM-2O; Sun, 03 Jan 2021 08:05:01 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw347-0003FZ-8z; Sun, 03 Jan 2021 08:05:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id w5so28169854wrm.11;
 Sun, 03 Jan 2021 05:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YU1+4NwadEE3N+OESJxPKN86R8fGB0+GBAw3oHs9kEI=;
 b=nWcr//BQWeoemUa4ecrXAtoyxBmKMNh0s3zHxxDkurcPdR7fvmZiql0va6e471Igx1
 vJJaTssz/FA+KlD5CWYMW38RHAZrkVkPGJmaLC/7ezzlJKLtr+DCBqqFHTZcZmUwCFGr
 F66L1f0dKLabVLHGQw0fWDGdHaV+tuzgR2gTodoaak9s2UQmss1IebBRdlWmJvHg7AjX
 tiSZqnYvJHf1WUH/nRLqsxCF6i7SxZNFSc6MmCg6BoW8+O1s5mEtJ/NtF+EX98A5oWSq
 y1yI9bSmgeVfvbC9jBT2KucHRuW83I+WQ4SpP94Yq7NqdPZujeTvb+dYvXMFEEJkYsNZ
 4seA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YU1+4NwadEE3N+OESJxPKN86R8fGB0+GBAw3oHs9kEI=;
 b=MoBD0iWBZUMxAImL1BfqIfsTeckR0Ht4TNgop21/RNxdPaBXcKmPf9IMQvbpI6dZ1q
 GT76ffcOETzuL9PTudnAjjMiQR/bPjj61GQilzKEXSHJ+Dejm2PT02n9I5GHnbAJwRUg
 3SJ0hjW0rqRgKxIMGMjEFc/RRKoS5o8fqZZRA7PsNTRFWEJYmMOxdA4kT9vzuRIAwN7o
 Ykz0Aubt+qCQhlQq1/rpOzHYZk3rVx/HGuHOgTN8D4BdZz4wNuQge+UYJIeXQvHP+DeW
 nwn/0I9zKg1qtdyQCAH7hrziN24svbKJ2MloabLGzkJiOq2mzKfyOZJb1jR7RICJXCMs
 OztA==
X-Gm-Message-State: AOAM531U3ugg6+hwIqy10vgrjQmQcjOD8xT0kUGg4U41jqWL+cVeD5Oc
 sJ2+0Mkh/ZroSuvALRwzPt0=
X-Google-Smtp-Source: ABdhPJynJccwG9STFPGTdIrwHAvK7bKQV0SRmf36YPSMtmYFUisMuWulGJ0B9N5hF7jqbfMQTHD1BA==
X-Received: by 2002:a5d:470d:: with SMTP id y13mr76076750wrq.309.1609679096144; 
 Sun, 03 Jan 2021 05:04:56 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id x25sm27360980wmc.3.2021.01.03.05.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:04:55 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
Date: Sun, 3 Jan 2021 14:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 03 Jan 2021 13:05:01 -0000

On 10/12/20 2:45 PM, Philippe Mathieu-Daudé wrote:
> Trivial patches using the generic PCI macros from "hw/pci/pci.h".
> 
> Philippe Mathieu-Daudé (5):
>   hw/pci-host/bonito: Make PCI_ADDR() macro more readable
>   hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'
>   hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'
>   hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
>   hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'

As this series are trivial and Acked, I'm going to queue
it via the mips-tree, as other reviewed patches depend
on it.

Thanks,

Phil.

