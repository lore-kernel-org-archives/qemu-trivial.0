Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dWxka-0000dn-Rp
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jul 2017 00:35:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxkY-0000cR-Kp
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 00:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxkX-0005x0-Qo
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 00:35:14 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxkT-0005uM-Ea; Mon, 17 Jul 2017 00:35:09 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so19383017qki.1;
	Sun, 16 Jul 2017 21:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QxY8dPEbmtmqLgF2BMj3w6lwqZ6UrCBH6xohAq1IUP8=;
	b=L8c2ZcBuYHlnvT6J1hijk8Zl55zu+eAOWx6+C8K/qhkXUoYdJ7faYcdbPFFQX0nuQb
	l1URI4ufDPyNwa1Jq6A/sUxlbGSmQxN18gXH7vToHeqnrWrHpvg/he8DZtNF7Fqtt3kC
	I2UWWJGBzuMJHqp91M5Hn/lYqn0yqafduC3hdj4XuAO8wimsmbz38jqUpM1t2qWhqISF
	Z76nneTSQ5cUuZYxmZel+Lv3UozgvgoyqX0rgxQO6QBej8LuN9Qh0+uqjcKkKNStrsVU
	H//A18i+9+cS2F56yxhvYnpbp/ZgmAaXkkiZccm1Z5VfbRZH8GWvhETQiHzM0Vd46eGT
	cyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QxY8dPEbmtmqLgF2BMj3w6lwqZ6UrCBH6xohAq1IUP8=;
	b=h38cq7JZH2iH9Ly6eq9oc16VsvSnKrxczi0auk6+nmhHbk3sjxRnwmkCx4f9B++EKG
	uF/62HqH6xyo0B9rRtMxVP8eyj49QtEUvsVv09Yz+71rq+d5NiV7R17IC1uUz4l2ENDH
	nOkTq0EhJ8aU7xPUS6/0tRtTRaKQSa4Q7VLEPykUXbW6AncZJB/3DBEG+pL1H84leX9k
	3psmteyNYWokrax3VtzIE6gkvulVpmNYgWxVTRKV5QAw5Mt59SQshHKqtN8cZMNDFVS8
	UEeppJH0fr1kYuaoHAk48LNQz1YCg1MeGq8rAX7kCiiI7NiPVMwgm5CWFV4bjKm9so4m
	/Guw==
X-Gm-Message-State: AIVw111iqnfsLw2kqDBjS8IQml2gJGwgHYHjARI8MA3153Hdwa6GyBH6
	RE62IC9gTczYiZf+wKk=
X-Received: by 10.55.69.66 with SMTP id s63mr24799948qka.229.1500266108632;
	Sun, 16 Jul 2017 21:35:08 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m123sm11652692qke.12.2017.07.16.21.35.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 21:35:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>, mdroth@linux.vnet.ibm.com,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <1500158641-23033-1-git-send-email-peng.hao2@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <953bc962-9929-c933-e0df-678a7e6a4c60@amsat.org>
Date: Mon, 17 Jul 2017 01:35:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500158641-23033-1-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga-win32: remove a
 redundancy code
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jul 2017 04:35:15 -0000

Cc'ing qemu-trivial

On 07/15/2017 07:44 PM, Peng Hao wrote:
> In the first line of run_agent,it has set ga_state = s,don't need
> set ga_state = s again behind.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   qga/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/main.c b/qga/main.c
> index 405c129..dcd6104 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -1314,7 +1314,7 @@ static int run_agent(GAState *s, GAConfig *config, int socket_activation)
>       ga_command_state_init(s, s->command_state);
>       ga_command_state_init_all(s->command_state);
>       json_message_parser_init(&s->parser, process_event);
> -    ga_state = s;
> +
>   #ifndef _WIN32
>       if (!register_signal_handlers()) {
>           g_critical("failed to register signal handlers");
> 

