<?php

namespace PayPal\Api;

use PayPal\Common\PayPalModel;

/**
 * Class ItemList
 *
 * List of items being paid for.
 *
 * @package PayPal\Api
 *
 * @property \PayPal\Api\Item[] items
 * @property \PayPal\Api\ShippingAddress shipping_address
 * @property string shipping_method
 * @property string shipping_phone_number
 */
class ItemList extends PayPalModel
{
    /**
     * List of items.
     *
     * @param \PayPal\Api\Item[] $items
     * 
     * @return $this
     */
    public function setItems($items)
    {
        $this->items = $items;
        return $this;
    }

    /**
     * List of items.
     *
     * @return \PayPal\Api\Item[]
     */
    public function getItems()
    {
        return $this->items;
    }

    /**
     * Append Items to the list.
     *
     * @param \PayPal\Api\Item $item
     * @return $this
     */
    public function addItem($item)
    {
        if (!$this->getItems()) {
            return $this->setItems([$item]);
        } else {
            return $this->setItems(
                array_merge($this->getItems(), [$item])
            );
        }
    }

    /**
     * Remove Items from the list.
     *
     * @param \PayPal\Api\Item $item
     * @return $this
     */
    public function removeItem($item)
    {
        return $this->setItems(
            array_diff($this->getItems(), [$item])
        );
    }

    /**
     * Shipping address.
     *
     * @param \PayPal\Api\ShippingAddress $shipping_address
     * 
     * @return $this
     */
    public function setShippingAddress($shipping_address)
    {
        $this->shipping_address = $shipping_address;
        return $this;
    }

    /**
     * Shipping address.
     *
     * @return \PayPal\Api\ShippingAddress
     */
    public function getShippingAddress()
    {
        return $this->shipping_address;
    }

    /**
     * Shipping method used for this payment like USPSParcel etc.
     *
     * @param string $shipping_method
     * 
     * @return $this
     */
    public function setShippingMethod($shipping_method)
    {
        $this->shipping_method = $shipping_method;
        return $this;
    }

    /**
     * Shipping method used for this payment like USPSParcel etc.
     *
     * @return string
     */
    public function getShippingMethod()
    {
        return $this->shipping_method;
    }

    /**
     * Allows merchant's to share payer’s contact number with PayPal for the current payment. Final contact number of payer associated with the transaction might be same as shipping_phone_number or different based on Payer’s action on PayPal. The phone number must be represented in its canonical international format, as defined by the E.164 numbering plan
     *
     * @param string $shipping_phone_number
     * 
     * @return $this
     */
    public function setShippingPhoneNumber($shipping_phone_number)
    {
        $this->shipping_phone_number = $shipping_phone_number;
        return $this;
    }

    /**
     * Allows merchant's to share payer’s contact number with PayPal for the current payment. Final contact number of payer associated with the transaction might be same as shipping_phone_number or different based on Payer’s action on PayPal. The phone number must be represented in its canonical international format, as defined by the E.164 numbering plan
     *
     * @return string
     */
    public function getShippingPhoneNumber()
    {
        return $this->shipping_phone_number;
    }

}
