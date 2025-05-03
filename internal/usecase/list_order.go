package usecase

import (
	"github.com/devfullcycle/20-CleanArch/internal/entity"
)

type ListOrderOutputDTO struct {
	Orders []OrderOutputDTO `json:"orders"`
}

type ListOrderUseCase struct {
	OrderRepository entity.OrderRepositoryInterface
}

func NewListOrderUseCase(OrderRepository entity.OrderRepositoryInterface) *ListOrderUseCase {
	return &ListOrderUseCase{
		OrderRepository: OrderRepository,
	}
}
func (c *ListOrderUseCase) Execute() (ListOrderOutputDTO, error) {
	orders, err := c.OrderRepository.ListAll()
	if err != nil {
		return ListOrderOutputDTO{}, err
	}

	var orderDTOs []OrderOutputDTO
	for _, order := range orders {
		orderDTOs = append(orderDTOs, OrderOutputDTO{
			ID:         order.ID,
			Price:      order.Price,
			Tax:        order.Tax,
			FinalPrice: order.Price + order.Tax,
		})
	}

	return ListOrderOutputDTO{Orders: orderDTOs}, nil
}
