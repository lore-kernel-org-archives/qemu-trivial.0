Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qIrnC-0005QK-IX
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jul 2023 10:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wilhelm.Golz@secunet.com>)
 id 1qIrig-0003RJ-6L
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 10:18:30 -0400
Received: from a.mx.secunet.com ([62.96.220.36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wilhelm.Golz@secunet.com>)
 id 1qIrie-0001vC-7Z
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 10:18:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 1D2BA2074F
 for <qemu-trivial@nongnu.org>; Mon, 10 Jul 2023 16:18:24 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYoShN41es16 for <qemu-trivial@nongnu.org>;
 Mon, 10 Jul 2023 16:18:23 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id A1408205CD
 for <qemu-trivial@nongnu.org>; Mon, 10 Jul 2023 16:18:23 +0200 (CEST)
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
 by mailout1.secunet.com (Postfix) with ESMTP id 991E480004A
 for <qemu-trivial@nongnu.org>; Mon, 10 Jul 2023 16:18:23 +0200 (CEST)
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 16:18:23 +0200
Received: from [172.18.156.217] (172.18.156.217) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 10 Jul
 2023 16:18:22 +0200
Message-ID: <12100964-f7c6-58fd-5f30-3394f1621df4@secunet.com>
Date: Mon, 10 Jul 2023 16:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Wilhelm Golz <wilhelm.golz@secunet.com>
Organization: secunet Security Networks AG
To: <qemu-trivial@nongnu.org>
Subject: Ping to patch request "add option for a multislot usb ccid device"
 (Klaus Ripke, 20.03.2023)
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Received-SPF: pass client-ip=62.96.220.36;
 envelope-from=Wilhelm.Golz@secunet.com; helo=a.mx.secunet.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Jul 2023 10:23:08 -0400
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
X-List-Received-Date: Mon, 10 Jul 2023 14:18:30 -0000

Hello,

I would like to remind the request of my former colleague
Klaus Ripke, who posted a smaller patch-request to this list

"add option for a multislot usb ccid device"  by the 20th of March 2023.

Are there any reasons to not take this patch upstream or
do we have to improve things? Klaus is no longer working
in our team, so I have taken over this topic.

Thanks in advance for Your reply and kind regards

Wilhelm

