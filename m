Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tt0e0-0004Ln-69
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2025 04:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tt0dy-0004G4-BL
 for qemu-trivial@nongnu.org; Fri, 14 Mar 2025 04:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tt0du-0007Tq-L5
 for qemu-trivial@nongnu.org; Fri, 14 Mar 2025 04:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741941824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f08biwYzFNPIjfEOGFgqie1Ik7LsKxoELm1ESjYAIDg=;
 b=U1S/kkL6bAQL5HSMU9SCl3HUa+N0C1k/hXtAHyspgSuEAnx+3c+EHu2mJi6Fg7ffcbrV8C
 wPHoN5qkf/ctJO4XC+CSeFBd8Cpz8Z6WBUZ7HGse7T3GowE49GfJbdDncxV8VUBPvfNK8b
 cMNBfwNnIwv2ZC9NhY4txyBO390F+sE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-6Dq7Vk0HPV6MwX1WFEfJfQ-1; Fri, 14 Mar 2025 04:43:39 -0400
X-MC-Unique: 6Dq7Vk0HPV6MwX1WFEfJfQ-1
X-Mimecast-MFC-AGG-ID: 6Dq7Vk0HPV6MwX1WFEfJfQ_1741941818
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3913f97d115so923691f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 14 Mar 2025 01:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741941818; x=1742546618;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f08biwYzFNPIjfEOGFgqie1Ik7LsKxoELm1ESjYAIDg=;
 b=BiSyatjKTjqpkUW05pCJs0fyWUkytzeEEFVGuOH1xxuMB4LzekG0QyLh3fM4n4PKZ4
 TZATDY7VYv1ZvXA3L/cQEMm8TnxT+E9GYoozfiosJt+54rLU+S4Q1C8uZovp6Nb0Roj0
 JXZkLoEnFZAUIWuXdnCTkF2xpAepahrW6VsZ0lYREaHkqNDQWYOUk/ybA/WN8bqoXz5w
 KJye0h3mrWva3bT6UHKTwZkyP7cKggo6p3kYEOcHCOukL7HDdkodJAiFIawFSj5oZDsN
 pyro+IKvkz933bVv6u8AU09LoLQ4P8bHOmQN5+ob7IOY7uGupCvSWVEJ1oBBwFu5OvoT
 4hog==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ML34/pCBAZ1J+US7MdrZisSezXrM06IzdjmUwANG8BUzJ+AtJ6ux+E4uSjKm0EYQJrdGneYGDZq2/R4=@nongnu.org
X-Gm-Message-State: AOJu0YwfU1qHF626a8eOoFWxGoKkrXADwDAKylsaNEAB+/8p+R8G0EA4
 9RmhNtqeMQOVcKyh3Ft7202pmysaIc3pBFgPQm7pWgJ/4/wsPTLuWyou1jMnFaR+BA34enLisnc
 +DBxDJkvrrM/ve+Jw1dURPuvNU37+kxjTOyMuejV80x0TC4stzRmVkC4=
X-Gm-Gg: ASbGncvymdX0fF7acRq0TiFog6hWb0L7nfJS+3WNJE4kcPup+NVIf6CReSagkA9tom4
 66GHAsRTpZesAH6FBkiaMO3UXLJi0SQzVEs8I7vEvBt5zq892xD8XWW6upNiM1ZXZAvj0H3Qz31
 1C5QwMGWUkq7i2fcMcKpfkLvfSdfXDhFMkhBTPudMbsBHJG1bN4UIb04HzBWcw/VpGBTM7WlOIP
 DfbpbOW6ENQ7bAV0B6Q++Fhzj0lVTLDxc5luva+IV/Z/ROi93xk0q0tVlwZBzpytkig69AW8BZ7
 M5/FN+u/OpocuJ4kz8oIe/Y/iP4XtcSQUZFb7LhZKLZ/8+jefjW5vQ==
X-Received: by 2002:a5d:588b:0:b0:391:32d5:157b with SMTP id
 ffacd0b85a97d-395b758f8a9mr5457486f8f.12.1741941817840; 
 Fri, 14 Mar 2025 01:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYrE6b/JbjIHJ/cdUMYR6jwpKUF1xvNLkJea4C8xzIqURHPdBXBWJttTjhvWStDEzximTt1Q==
X-Received: by 2002:a5d:588b:0:b0:391:32d5:157b with SMTP id
 ffacd0b85a97d-395b758f8a9mr5457462f8f.12.1741941817403; 
 Fri, 14 Mar 2025 01:43:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c?
 ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c2690sm4795640f8f.25.2025.03.14.01.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:43:36 -0700 (PDT)
Message-ID: <07d0ed00-f8ec-4b80-a6d6-368807998039@redhat.com>
Date: Fri, 14 Mar 2025 09:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Explain how to use passt
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Brivio <sbrivio@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20250311132714.166189-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20250311132714.166189-1-lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QLAKTafvg8LRjz5kTcbF_UgcPRny-d6SU0S_UkZuiUM_1741941818
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=0.523, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 Mar 2025 08:43:50 -0000

cc: trivial

On 11/03/2025 14:27, Laurent Vivier wrote:
> Add a chapter to explain how to use passt(1) instead of '-net user'.
> passt(1) can be connected to QEMU using UNIX socket or vhost-user.
> With vhost-user, migration of the VM is allowed and internal state of
> passt(1) is transfered from one side to the other
> 
> Bug: https://gitlab.com/qemu-project/qemu/-/issues/2827
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   docs/system/devices/net.rst | 100 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 100 insertions(+)
> 
> diff --git a/docs/system/devices/net.rst b/docs/system/devices/net.rst
> index 2ab516d4b097..a3efbdcabd1a 100644
> --- a/docs/system/devices/net.rst
> +++ b/docs/system/devices/net.rst
> @@ -77,6 +77,106 @@ When using the ``'-netdev user,hostfwd=...'`` option, TCP or UDP
>   connections can be redirected from the host to the guest. It allows for
>   example to redirect X11, telnet or SSH connections.
>   
> +Using passt as the user mode network stack
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +passt_ can be used as a simple replacement for SLIRP (``-net user``).
> +passt doesn't require any capability or privilege. passt has
> +better performance than ``-net user``, full IPv6 support and better security
> +as it's a daemon that is not executed in QEMU context.
> +
> +passt can be connected to QEMU either by using a socket
> +(``-netdev stream``) or using the vhost-user interface (``-netdev vhost-user``).
> +See `passt(1)`_ for more details on passt.
> +
> +.. _passt: https://passt.top/
> +.. _passt(1): https://passt.top/builds/latest/web/passt.1.html
> +
> +To use socket based passt interface:
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Start passt as a daemon::
> +
> +   passt --socket ~/passt.socket
> +
> +If ``--socket`` is not provided, passt will print the path of the UNIX domain socket QEMU can connect to (``/tmp/passt_1.socket``, ``/tmp/passt_2.socket``,
> +...). Then you can connect your QEMU instance to passt:
> +
> +.. parsed-literal::
> +   |qemu_system| [...OPTIONS...] -device virtio-net-pci,netdev=netdev0 -netdev stream,id=netdev0,server=off,addr.type=unix,addr.path=~/passt.socket
> +
> +Where ``~/passt.socket`` is the UNIX socket created by passt to
> +communicate with QEMU.
> +
> +To use vhost-based interface:
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Start passt with ``--vhost-user``::
> +
> +   passt --vhost-user --socket ~/passt.socket
> +
> +Then to connect QEMU:
> +
> +.. parsed-literal::
> +   |qemu_system| [...OPTIONS...] -m $RAMSIZE -chardev socket,id=chr0,path=~/passt.socket -netdev vhost-user,id=netdev0,chardev=chr0 -device virtio-net,netdev=netdev0 -object memory-backend-memfd,id=memfd0,share=on,size=$RAMSIZE -numa node,memdev=memfd0
> +
> +Where ``$RAMSIZE`` is the memory size of your VM ``-m`` and ``-object memory-backend-memfd,size=`` must match.
> +
> +Migration of passt:
> +^^^^^^^^^^^^^^^^^^^
> +
> +When passt is connected to QEMU using the vhost-user interface it can
> +be migrated with QEMU and the network connections are not interrupted.
> +
> +As passt runs with no privileges, it relies on passt-repair to save and
> +load the TCP connections state, using the TCP_REPAIR socket option.
> +The passt-repair helper needs to have the CAP_NET_ADMIN capability, or run as root. If passt-repair is not available, TCP connections will not be preserved.
> +
> +Example of migration of a guest on the same host
> +________________________________________________
> +
> +Before being able to run passt-repair, the CAP_NET_ADMIN capability must be set
> +on the file, run as root::
> +
> +   setcap cap_net_admin+eip ./passt-repair
> +
> +Start passt for the source side::
> +
> +   passt --vhost-user --socket ~/passt_src.socket --repair-path ~/passt-repair_src.socket
> +
> +Where ``~/passt-repair_src.socket`` is the UNIX socket created by passt to
> +communicate with passt-repair. The default value is the ``--socket`` path
> +appended with ``.repair``.
> +
> +Start passt-repair::
> +
> +   passt-repair ~/passt-repair_src.socket
> +
> +Start source side QEMU with a monitor to be able to send the migrate command:
> +
> +.. parsed-literal::
> +   |qemu_system| [...OPTIONS...] [...VHOST USER OPTIONS...] -monitor stdio
> +
> +Start passt for the destination side::
> +
> +   passt --vhost-user --socket ~/passt_dst.socket --repair-path ~/passt-repair_dst.socket
> +
> +Start passt-repair::
> +
> +   passt-repair ~/passt-repair_dst.socket
> +
> +Start QEMU with the ``-incoming`` parameter:
> +
> +.. parsed-literal::
> +   |qemu_system| [...OPTIONS...] [...VHOST USER OPTIONS...] -incoming tcp:localhost:4444
> +
> +Then in the source guest monitor the migration can be started::
> +
> +   (qemu) migrate tcp:localhost:4444
> +
> +A separate passt-repair instance must be started for every migration. In the case of a failed migration, passt-repair also needs to be restarted before trying
> +again.
> +
>   Hubs
>   ~~~~
>   


